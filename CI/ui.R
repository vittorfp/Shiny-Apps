shinyUI(fluidPage(
	#Title
    titlePanel("Confidence Intervals"),
    
    #Sidebar Panel
    sidebarLayout(
        position = "right",
        sidebarPanel(
            helpText("Use these controls to vary the parameters 
                     of the plotting."),
            br(),

            #Significance Level slider
            sliderInput(
                "alpha", 
                label=h5("Significance level"),
                min = 0.005,
                max = 0.995,
                step = 0.01,
                value = 0.05,
                animate = TRUE
            ),

            #Mean slider
            sliderInput(
                "mu", 
                label=h5("Desired mean"),
                min = 47,
                max = 53,
                step = 1,
                value = 50
            ),
            
            #Number of intervals slider
            sliderInput(
                "K", 
                label=h5("Number of intervals"),
                min = 10,
                max = 1000,
                step = 1,
                value = 100
            ),
            
            #sample size slider
            sliderInput(
                "N", 
                label=h5("Sample size"),
                min = 2,
                max = 200,
                step = 1,
                value = 25,
                animate = TRUE
            ),

            #standard deviation slider
            sliderInput(
                "sd", 
                label = h5("Standard deviation"),
                min = 1,
                max = 20,
                step = 1,
                value = 2,
                animate = TRUE
            ),
            br()
            
            
        ),
        
        
        #Main Panel
        mainPanel(
        	#Shows the plot output
            plotOutput("graph")
        )
    )
))
