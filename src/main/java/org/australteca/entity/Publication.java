package org.australteca.entity;

import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.ngram.EdgeNGramFilterFactory;
import org.apache.lucene.analysis.ngram.EdgeNGramTokenizerFactory;
import org.apache.lucene.analysis.snowball.SnowballPorterFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.australteca.Constants;
import org.hibernate.search.annotations.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tomi on 29/04/17.
 */

@Entity
@Indexed
@AnalyzerDef(name = "customanalyzer",
        tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
        filters = {
                @TokenFilterDef(factory = LowerCaseFilterFactory.class),
                @TokenFilterDef(factory = EdgeNGramFilterFactory.class),
                @TokenFilterDef(factory = SnowballPorterFilterFactory.class, params = {
                        @Parameter(name = "language", value = "English")
                })
        })
public class Publication extends AbstractEntity{

    @Field
    @Analyzer(definition = "customanalyzer")
    private String name;

    @ManyToOne
    private User author;

    @ManyToMany
    private List<User> suscribedUsers = new ArrayList<>();

    @Column(length = 1024*1024)
    private String description;
    private String role;

    public Publication(){

    }

    public Publication(String name, User author, String description, String role) {
        this.name = name;
        this.author = author;
        this.description = description;
        this.role = role;
    }

    public List<User> getSuscribedUsers() {
        return suscribedUsers;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User contact) {
        this.author = contact;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setSuscribedUsers(List<User> suscribedUsers) {
        this.suscribedUsers = suscribedUsers;
    }
}
