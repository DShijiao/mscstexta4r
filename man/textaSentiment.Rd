% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textaSentiment.R
\name{textaSentiment}
\alias{textaSentiment}
\title{Assesses the sentiment of sentences or documents.}
\usage{
textaSentiment(documents, languages = rep("en", length(documents)))
}
\arguments{
\item{documents}{(character vector) Vector of sentences or documents for
which to assess sentiment.}

\item{languages}{(character vector) Languages of the sentences or documents,
supported values: "en"(English, default), "es"(Spanish), "fr"(French),
"pt"(Portuguese)}
}
\value{
An S3 object of the class \code{\link{texta}}. The results are stored
in the \code{results} dataframe inside this object. The dataframe contains
the original sentences or documents and their sentiment score. If an error
occurred during processing, the dataframe will also have an \code{error}
column that describes the error.
}
\description{
This function returns a numeric score between 0 and 1 with
scores close to 1 indicating positive sentiment and scores close to 0
indicating negative sentiment.

Sentiment score is generated using classification techniques. The input
features of the classifier include n-grams, features generated from
part-of-speech tags, and word embeddings. English, French, Spanish and
Portuguese text are supported.

Internally, this function invokes the Microsoft Cognitive Services Text
Analytics REST API documented at \url{https://www.microsoft.com/cognitive-services/en-us/text-analytics/documentation}.

You MUST have a valid Microsoft Cognitive Services account and an API key for
this function to work properly. See \url{https://www.microsoft.com/cognitive-services/en-us/pricing}
for details.
}
\examples{
\dontrun{

 docsText <- c(
   "Loved the food, service and atmosphere! We'll definitely be back.",
   "Very good food, reasonable prices, excellent service.",
   "It was a great restaurant.",
   "If steak is what you want, this is the place.",
   "The atmosphere is pretty bad but the food is quite good.",
   "The food is quite good but the atmosphere is pretty bad.",
   "I'm not sure I would come back to this restaurant.",
   "The food wasn't very good.",
   "While the food was good the service was a disappointment.",
   "I was very disappointed with both the service and my entree."
 )
 docsLanguage <- rep("en", length(docsText))

 tryCatch({

   # Perform sentiment analysis
   docsSentiment <- textaSentiment(
     documents = docsText,    # Input sentences or documents
     languages = docsLanguage
     # "en"(English, default)|"es"(Spanish)|"fr"(French)|"pt"(Portuguese)
   )

   # Class and structure of docsSentiment
   class(docsSentiment)
   #> [1] "texta"
   str(docsSentiment, max.level = 1)
   #> List of 3
   #>  $ results:'data.frame': 10 obs. of  2 variables:
   #>  $ json   : chr "{\\"documents\\":[{\\"score\\":0.9903013,\\"id\\":\\"hDgKc\\", __truncated__ }]}
   #>  $ request:List of 7
   #>   ..- attr(*, "class")= chr "request"
   #>  - attr(*, "class")= chr "texta"

   # Print results
   docsSentiment
   #> texta [https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment]
   #>
   #> --------------------------------------
   #>              text               score
   #> ------------------------------ -------
   #>  Loved the food, service and    0.9847
   #>  atmosphere! We'll definitely
   #>            be back.
   #>
   #>  Very good food, reasonable     0.9831
   #>  prices, excellent service.
   #>
   #>  It was a great restaurant.     0.9306
   #>
   #>  If steak is what you want,     0.8014
   #>      this is the place.
   #>
   #> The atmosphere is pretty bad    0.4998
   #>  but the food is quite good.
   #>
   #> The food is quite good but the   0.475
   #>   atmosphere is pretty bad.
   #>
   #> I'm not sure I would come back  0.2857
   #>      to this restaurant.
   #>
   #>   The food wasn't very good.    0.1877
   #>
   #>  While the food was good the   0.08727
   #> service was a disappointment.
   #>
   #>  I was very disappointed with  0.01877
   #>    both the service and my
   #>            entree.
   #> --------------------------------------

 }, error = function(err) {

   # Print error
   geterrmessage()

 })
}
}
\author{
Phil Ferriere \email{pferriere@hotmail.com}
}

