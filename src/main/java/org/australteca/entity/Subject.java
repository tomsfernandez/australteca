package org.australteca.entity;

import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.snowball.SnowballPorterFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Parameter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tomi on 29/03/17.
 */

@Entity @Indexed
@Table(name = "SUBJECT")
@AnalyzerDef(name = "subjectAnalyzer",
        tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
        filters = {
                @TokenFilterDef(factory = LowerCaseFilterFactory.class),
                @TokenFilterDef(factory = SnowballPorterFilterFactory.class, params = {
                        @Parameter(name = "language", value = "English")
                })
        })
public class Subject {

    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "SUBJECT_ID")
    @DocumentId
    private int id;

    @OneToMany
    private final List<Commentary> commentaryList = new ArrayList<Commentary>();

    @Column (name = "SUBJECT_SCORE")
    private double score;

    @Column (name = "SUBJECT_AMOUNT_OF_SCORES")
    private double amountOfScores;

    @Field(index= Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Column (name = "SUBJECT_NAME")
    @Analyzer(definition = "subjectAnalyzer")
    private String subjectName;

    @IndexedEmbedded
    @ManyToMany
    private final List<Professor> professors = new ArrayList<Professor>();

    @OneToMany (cascade = CascadeType.ALL)
    private final List<Commentary> commentaries = new ArrayList<Commentary>();

    @ManyToMany 
    private final List<User> subscribedUsers = new ArrayList<User>();

    public Subject() {
    }

    public Subject(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public List<Commentary> getCommentaryList() {
        return commentaryList;
    }

    public double getScore() {
        return score;
    }

    public double getAmountOfScores() {
        return amountOfScores;
    }

    public void addToScore(double scoreAdd){
        score = amountOfScores*score + scoreAdd;
        amountOfScores++;
        score = score/amountOfScores;
    }

    public List<Professor> getProfessors() {
        return professors;
    }

    public List<User> getSubscribedUsers() {
        return subscribedUsers;
    }
}