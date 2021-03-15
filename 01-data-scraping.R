# load libraries
library(tidyverse)
library(rvest)

# urls
bic_for_her_url <- "https://www.amazon.com/BIC-Cristal-1-0mm-Black-MSLP16-Blk/product-reviews/B004F9QBE6/ref=cm_cr_getr_d_paging_btm_prev_1?ie=UTF8&reviewerType=all_reviews&pageNumber="
bic_retractable_url <- "https://www.amazon.com/BIC-Retractable-Medium-Point-24-Count/product-reviews/B00H2H3C2W/ref=cm_cr_getr_d_paging_btm_prev_1?ie=UTF8&reviewerType=all_reviews&pageNumber="

# get for her reviews
for_her_reviews <- data.frame()
# create a for loop for page number
for (i in c(1:204)){
  # add base url to page number
  url <- paste0(bic_for_her_url, i)
  
  # read in html file
  amazon_reviews <- read_html(url)
  
  # get nodes
  review_text <- amazon_reviews %>%
    html_nodes(".review-text-content") %>%
    html_text()

  # bind rows of this page data frame with the rest of the data
    for_her_reviews <- for_her_reviews %>%
      bind_rows(data.frame(text = review_text))
                                
}


# get retractable reviews
retractable_reviews <- data.frame()
# create a for loop for page number
for (i in c(1:204)){
  # add base url to page number
  url <- paste0(bic_for_her_url, i)
  
  # read in html file
  amazon_reviews <- read_html(url)
  
  # get nodes
  review_text <- amazon_reviews %>%
    html_nodes(".review-text-content") %>%
    html_text()
  
  # bind rows of this page data frame with the rest of the data
  retractable_reviews <- retractable_reviews %>%
    bind_rows(data.frame(text = review_text))
  
}
