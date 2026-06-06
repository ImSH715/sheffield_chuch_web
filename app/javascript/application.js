import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const cards = document.querySelectorAll(".card, .hero-card")

  const observer = new IntersectionObserver(
    entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible")
        }
      })
    },
    { threshold: 0.15 }
  )

  cards.forEach(card => observer.observe(card))

  const progressBars = document.querySelectorAll("[data-progress]")

  progressBars.forEach(bar => {
    const value = bar.dataset.progress || "0"
    bar.style.setProperty("--progress", `${value}%`)
  })

  const bibleCompleteButton = document.querySelector("[data-bible-complete]")

  if (bibleCompleteButton) {
    bibleCompleteButton.addEventListener("click", () => {
      bibleCompleteButton.classList.add("completed-pulse")
      bibleCompleteButton.textContent = "Completed for today ✓"
    })
  }
})