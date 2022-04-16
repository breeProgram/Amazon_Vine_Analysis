# Amazon_Vine_Analysis
## Introduction
This project was to analyzing Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review. After choosing one dataset out of approximately 50, I use PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Next, I use Pandas and SQL to determine if there is any bias toward favorable reviews from Vine members in the dataset.
## Results
### Pandas Analysis
![analysis_process](https://user-images.githubusercontent.com/56700719/163690536-5bb1a675-5444-4c07-a689-86598ca28ddf.JPG)

To determine if having a paid Vine review makes a difference in the percentage of 5-star reviews, first step was to create a dataframe in Pandas to retrieve all rows where the total_votes count is equal to or greater than 20 to pick reviews that are more likely to be helpful. The next step was to filter that dataframe to create another one to retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%. Finally, that dataframe is filtered to create 2 more, one with reviews written as part of the Vine program(paid) and one without reviews written with Vine program(unpaid).

![total_vine_non_vine](https://user-images.githubusercontent.com/56700719/163690542-bf4afba4-b852-4b58-a934-15671c8a671e.JPG)

- Total number of vine reviews: 94 and total number of non-vine reviews 40471.

![vine_review_table](https://user-images.githubusercontent.com/56700719/163690555-79518743-61fd-4824-b817-b988e8de3d97.JPG)

- The percentage of a paid review with 5-stars was 0.31% by taking paid 5-star over total 5-star reviews.
- The percentage of a non-paid review with 5-stars was 99.7% by taking unpaid 5-star over total 5-star reviews.

### pgAdmin Analysis
![all_total_vine](https://user-images.githubusercontent.com/56700719/163690623-02209341-2530-45e3-83da-52176d61fc59.JPG)

- The first query was to find the total amount of reviews in the dataset and compare it to the total amount of Vine reviews. There seem to be a disproportionate amount of Vine reviews with 4,290 compared to the total amount of reviews with 1,785,886 in this dataset.

![avg_vine_star](https://user-images.githubusercontent.com/56700719/163690634-84a0c598-a89f-4cd3-8b6a-aa6b8abdf700.JPG)

- Second query shows that all Vine reviews average out to be little over 4 stars.

![vine_review_dates](https://user-images.githubusercontent.com/56700719/163690647-36afc4d1-586f-443f-b97e-6268ca24180e.JPG)

- The last query is to show the range of dates from 2007 to 2015, when the Vine program was used in this dataset.

## Summary
After reviewing these results there does not seem to be enough evidence to show that the Vine program provided any biasness toward a product’s review. It should also be considered that there was barely any amount of Vine reviews compared to the total amount of review in this specific dataset. This dataset centered around video games, and I would recommend that other dataset be explored to create a more thorough analysis as well as exploring the affect Vine customers had on verified purchases.
