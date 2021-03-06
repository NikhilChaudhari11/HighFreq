% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/HighFreq.R
\name{vol_ohlc}
\alias{vol_ohlc}
\title{Calculate time series of volatility estimates from a \code{OHLC} time series.}
\usage{
vol_ohlc(log_ohlc, calc_method = "rogers.satchell")
}
\arguments{
\item{log_ohlc}{\code{OHLC} time series of log prices.}

\item{calc_method}{\code{character} string representing method for estimating volatility.}
}
\value{
time series of volatility estimates.
}
\description{
Calculate time series of volatility estimates from a \code{OHLC} time series.
}
\details{
Calculates volatility estimates from \code{OHLC} values at each
  point in time (row).  The methods include Garman-Klass and Rogers-Satchell.
}
\examples{
# create time index of one second intervals for a single day
in_dex <- seq(from=as.POSIXct("2015-02-09 09:30:00"),
              to=as.POSIXct("2015-02-09 16:00:00"), by="1 sec")
# create xts of random prices
x_ts <- xts(cumsum(rnorm(length(in_dex))), order.by=in_dex)
# add Volume data
x_ts <- merge(x_ts,
          volume=sample(x=10*(2:18),
            size=length(in_dex), replace=TRUE))
# aggregate to minutes OHLC data
oh_lc <- to.period(x=x_ts, period="minutes")
# calculate volatility estimates
vol_at <- vol_ohlc(oh_lc)
}

