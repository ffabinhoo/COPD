

output$explanation <- renderText({
 
  line<-"<div class=panel-body>" 
  line2<-"<p><strong><h1>COPD PROJECT - SAX INSTITUTE</h1></strong></p>
          <p><h2>Decision Analytics</h2></p>
          <p>Dr Jo-An Atkinson <a href=mailto:Jo-An.Atkinson@saxinstitute.org.au>Jo-An.Atkinson@saxinstitute.org.au</a>
              / 
             Dr Ante Prodan <a href=mailto:ante.prodan@saxinstitute.org.au>ante.prodan@saxinstitute.org.au</a>
          </p>
          <p><strong>Project ID:</strong> XXXXX-2018</p>
          <p><strong>Study Type:</strong> Baseline</p>
          <p>Year: 2010</p>
          <p>Investigators: Prof John Attia, Prof Emily Banks, Prof Adrian Bauman, Prof Ian Caterson, Prof John Chalmers, Ms Tien Chey, 
              Prof Don Chisholm, Prof Vicki Flood, A/Prof Tim Gill, Prof Leonard Kritharidis, Ms Isabel Latz, Prof Christopher Levi, 
              Prof Peter MacDonald, Dr Christopher Magee, Ms Suan Peng Ng, Dr Alex Peng, Dr Hidde van der Ploeg, Prof Carol Pollock, 
              Dr Katherine Samaras, Prof Mark Woodward.
          </p>"
  line3 <- ("<p>Cardiovascular disease remains the highest cause of death for adult Australians. Through linking the data obtained through 
                the 45 and Up Study with other data sources, this study aims to investigate risk factors for cardiovascular disease. 
                The study will investigate a number of established and emerging risk factors for cardiovascular disease including physical 
                activity/inactivity, erectile dysfunction, short sleep duration, diabetes, nutrition and obesity. 
            By examining the relationship between cardiovascular disease and these proposed risk factors the study hopes to provide much 
            needed information about the disease in the Australian context.</p>")
  line4 <- "</div>" 
  
  paste0(line, line2, line3, line4, collapse = "")
 
})
