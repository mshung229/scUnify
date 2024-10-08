% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing.R
\name{calculate_mad}
\alias{calculate_mad}
\title{calculate_mad}
\usage{
calculate_mad(x, columns, samples, stdev = 5)
}
\arguments{
\item{x}{Seurat object}

\item{columns}{a vector of metadata columns to calculate MAD}

\item{samples}{a metadata column of sample names}

\item{stdev}{label poor quality cells as stdev*MAD away from median for each column. Defaults to 5}
}
\description{
Calculate median absolute deviation (MAD) and identify poor quality cells
}
