import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["entryRow"];

  // Configuration options
  static values = {
    animationDelay: { type: Number, default: 50 },
    animationDuration: { type: Number, default: 500 },
  };

  connect() {
    this.addKeyboardListeners();
    this.setupInitialAnimation();
  }

  disconnect() {
    this.removeKeyboardListeners();
  }

  setupInitialAnimation() {
    if (!this.hasEntryRowTargets) return;

    // Animate the entries in sequence with staggered timing
    this.entryRowTargets.forEach((row, index) => {
      // Set initial state
      row.style.opacity = "0";
      row.style.transform = "translateY(20px)";

      // Stagger animations
      setTimeout(() => {
        row.style.transition = `opacity ${this.animationDurationValue}ms ease, transform ${this.animationDurationValue}ms ease`;
        row.style.opacity = "1";
        row.style.transform = "translateY(0)";
      }, this.animationDelayValue * index);
    });
  }

  // Keyboard event handling
  addKeyboardListeners() {
    this.boundHandleKeyDown = this.handleKeyDown.bind(this);
    document.addEventListener("keydown", this.boundHandleKeyDown);
  }

  removeKeyboardListeners() {
    document.removeEventListener("keydown", this.boundHandleKeyDown);
  }

  handleKeyDown(event) {
    switch (event.key) {
      case "Escape":
        this.exitPresentationMode();
        break;
      case "f":
      case "F":
        this.toggleFullscreen();
        break;
    }
  }

  // Navigation & display actions
  exitPresentationMode() {
    window.location.href = "/entries";
  }

  toggleFullscreen() {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen().catch((err) => {
        // Silently handle errors - fullscreen might not be available
      });
    } else if (document.exitFullscreen) {
      document.exitFullscreen();
    }
  }
}
