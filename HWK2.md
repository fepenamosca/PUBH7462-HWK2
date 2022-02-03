HWK2
================
Felipe Pena Mosca
2/3/2022

Part 1

``` r
# x = a random sample of size n = 1000 from N(0, 1) (rnorm())

x <- rnorm(1000,0,1)

# y = a random sample of size n = 1000 from N(1, 2)

y <- rnorm(1000,1,2)

# Create vector that combines x+y

z <- y + x

# sum_indicator = a logical variable, TRUE if x + y > 0.5 (hint: ifelse())

sum_indicator <- ifelse(z > 0.5,"Yes","No")

# Generate dataframe (need to use tibble for this)

test <- data.frame(x,y,sum_indicator)

# Relevel variable

test$sum_indicator <- forcats::fct_relevel(test$sum_indicator,"Yes","No")

# Scatter plot y by x

ggplot(test,aes(y = y,x = x,color = sum_indicator)) + 
  geom_point() +
  labs(title="Scatterplot of x by y",x ="Random Sample N(0, 1)", y = "Random Sample N(1, 2)",colour="x+y > 0.5")
```

<img src="HWK2_files/figure-gfm/Part 1-1.png" width="90%" style="display: block; margin: auto;" />

Part 2.1

This dataset includes 344 rows and 17 variables.

Variables included:

-   Sample: Number an integer denoting the continuous numbering sequence
    for each sample.

-   Species: a character string denoting the penguin species Region a
    character string denoting the region of Palmer LTER sampling grid.

-   Island: a character string denoting the island near Palmer Station
    where samples were collected.

-   Stage: a character string denoting reproductive stage at sampling.

-   Individual-ID: a character string denoting the unique ID for each
    individual in dataset.

-   Clutch Completion: a character string denoting if the study nest
    observed with a full clutch, i.e., 2 eggs.

-   Date Egg: a date denoting the date study nest observed with 1 egg
    (sampled).

-   Culmen Length: a number denoting the length of the dorsal ridge of a
    bird’s bill (millimeters).

-   Culmen Depth: a number denoting the depth of the dorsal ridge of a
    bird’s bill (millimeters).

-   Flipper Length: an integer denoting the length penguin flipper
    (millimeters) Body Mass an integer denoting the penguin body mass
    (grams).

-   Sex: a character string denoting the sex of an animal Delta 15 N a
    number denoting the measure of the ratio of stable isotopes 15N:14N.

-   Delta 13 C: a number denoting the measure of the ratio of stable
    isotopes 13C:12C.

-   Comments: a character string with text providing additional relevant
    information for data

``` r
# Part 2.1

# Upload data

penguin.df <- read_rds("./data/penguin.RDS")

#The number of observations (rows), variables/features (columns), and what each variable/feature describes about each observation

# Mean and standard deviation flipper length

mean(penguin.df$flipper_length_mm,na.rm = TRUE)
```

    ## [1] 200.9

``` r
sd(penguin.df$flipper_length_mm,na.rm = TRUE)
```

    ## [1] 14.06

``` r
# Mean and standard deviation bill length

mean(penguin.df$bill_length_mm,na.rm = TRUE)
```

    ## [1] 43.92

``` r
sd(penguin.df$flipper_length_mm,na.rm = TRUE)
```

    ## [1] 14.06

Part 2.2

``` r
# Part 2.2

# Scatter plot bill length by flipper length and species

ggplot(penguin.df,aes(y =flipper_length_mm,x =bill_length_mm,color=species)) + geom_point()+
labs(colour="Species")+labs(title="Scatterplot of flipper length by bill length and penguin species",x ="Bill length (mm)", y = "Flipper length (mm)")
```

<img src="HWK2_files/figure-gfm/Part 2.2-1.png" width="90%" style="display: block; margin: auto;" />

``` r
# Scatter plot bill length by flipper length and sex

ggplot(subset(penguin.df,!is.na(sex)),aes(y =flipper_length_mm,x =bill_length_mm,color=sex)) + geom_point() + labs(colour="Sex")+labs(title="Scatterplot of flipper length by bill length and penguin sex",x ="Bill length (mm)", y = "Flipper length (mm)")+ 
geom_smooth(formula = y ~ x, 
method  = "lm", 
se      = FALSE)+
facet_grid(~sex)
```

<img src="HWK2_files/figure-gfm/Part 2.2-2.png" width="90%" style="display: block; margin: auto;" />
This scatterplot shows a positive association between bill length (mm)
(independent variable) and flipper length (mm) (dependent variable) in
both female and male penguins
