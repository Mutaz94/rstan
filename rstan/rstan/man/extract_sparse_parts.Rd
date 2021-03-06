\name{extract_sparse_parts}
\alias{extract_sparse_parts}
\title{Extract the compressed representation of a sparse matrix}
\description{Create a list of vectors that represents a sparse matrix.} 

\usage{
extract_sparse_parts(A)
}

\arguments{
  \item{A}{A \code{\link{matrix}} or \code{\link[Matrix]{Matrix}}.}
}

\details{
  The Stan Math Library has a function called \code{csr_matrix_times_vector},
  which inputs a matrix in compressed row storage form and a dense vector and
  returns their product without fillin. To use the 
  \code{csr_matrix_times_vector} function with a large
  sparse matrix, it is optimal in terms of memory to simply pass the three vectors
  that characterize the compressed row storage form of the matrix to the 
  \code{data} block of the Stan program. 
  The \code{extract_sparse_parts} function provides a convenient means of 
  obtaining these vectors.
} 

\value{
  A named list with components 
  \enumerate{ 
    \item \code{w} A numeric vector containing the non-zero elements of \code{A}.
    \item \code{v} An integer vector containing the column indices of the non-zero
      elements of \code{A}.
    \item \code{u} An integer vector indicating where in \code{w} a given row's
      non-zero values start.
  } 
}
\examples{
  A <- rbind(
    c(19L, 27L,  0L,  0L),
    c( 0L,  0L,  0L,  0L),
    c( 0L,  0L,  0L, 52L),
    c(81L,  0L, 95L, 33L)
  )
  str(extract_sparse_parts(A))
}
