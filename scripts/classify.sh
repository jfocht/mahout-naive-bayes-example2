#!/bin/sh

[ -f env.sh ] && . env.sh

hadoop fs -put data/tweets-to-classify.tsv tweets-to-classify.tsv
hadoop jar target/mahout-naive-bayes-example2-1.0-jar-with-dependencies.jar \
    model \
    tweets-vectors/dictionary.file-0 \
    tweets-vectors/df-count/part-r-00000 \
    tweets-to-classify.tsv tweet-category
hadoop fs -getmerge tweet-category tweet-category.tsv
