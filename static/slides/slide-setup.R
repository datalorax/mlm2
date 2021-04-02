setup <- function(slides) {
  paste0(
  'layout: true

  <script>
    feather.replace()
  </script>
  
  <div class="slides-footer">
  <span>
  
  <a class = "footer-icon-link" href = "https://github.com/datalorax/mlm2/raw/main/static/slides/', slides, '.pdf">
    <i class = "footer-icon" data-feather="download"></i>
  </a>
  
  <a class = "footer-icon-link" href = "https://mlm2.netlify.app/slides/', slides, '.html">
    <i class = "footer-icon" data-feather="link"></i>
  </a>
  
  <a class = "footer-icon-link" href = "https://mlm2-2021.netlify.app">
    <i class = "footer-icon" data-feather="globe"></i>
  </a>
  
  <a class = "footer-icon-link" href = "https://github.com/datalorax/mlm2">
    <i class = "footer-icon" data-feather="github"></i>
  </a>
  
  </span>
  </div>
  '
  )
}