shinyServer(function(input, output) {
    
    output$graph <- renderPlot({ 
        set.seed(661857)    # Set PRNG seed (for reproducibility)
        mu<- input$mu       # desired mean
        sd<-input$sd        # desired standard deviation
        N<-input$N          # Desired sample size
        K<- input$K         # Number of CIs
        alpha<-input$alpha  # Significance level
        
        X<-matrix(rnorm(K*N,mean=mu,sd=sd),     # Generate a column matrix of samples
                  nrow=N)                       # of size N
        
        # Calculate upper and lower bounds for the K confidence intervals
        CI_lower<-apply(X,2,mean)-apply(X,2,sd)*qt(1-alpha/2,N-1)/sqrt(N)
        CI_upper<-apply(X,2,mean)+apply(X,2,sd)*qt(1-alpha/2,N-1)/sqrt(N)
        isout<-(CI_lower>mu)|(CI_upper<mu)  # Flag for which CIs that do not contain the
        # true parameter value
        plot(0,0,type="n",
             xlim=c(0,K),
             #ylim = range(pretty(X)),
             ylim=c(47,53),
             ylab="Resistance",
             xlab="Interval",
             las=1)
        for (i in 1:K){
            points(c(i,i),c(CI_lower[i],CI_upper[i]),
                   type="l",lwd=ifelse(isout[i],3,2),
                   col=ifelse(isout[i],"red","green"))
        }
        grid(NA, NULL)
        points(c(0,K),c(mu,mu),
               lty=2,lwd=3,type="l")
    })
})