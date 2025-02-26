import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "form"];

  // Configuration options - easy to adjust
  static values = {
    typingDelay: { type: Number, default: 800 },
    savingDelay: { type: Number, default: 500 },
    savedDelay: { type: Number, default: 1500 },
  };

  connect() {
    if (!this.hasInputTarget) return;

    // Initialize state
    this.pendingSave = false;
    this.lastValue = this.inputTarget.value || "";
    this.isFocused = false;

    // Border state
    this.borderStates = {
      default: ["border-gray-300", "dark:border-gray-700"],
      focus: ["border-indigo-400", "dark:border-indigo-500"],
      saving: ["border-yellow-400", "dark:border-yellow-500"],
      saved: ["border-green-500", "dark:border-green-600"],
    };

    this.setBorderState("default");
  }

  // Handle input focus
  handleFocus(event) {
    if (!this.hasInputTarget) return;

    this.isFocused = true;
    if (this.currentState === "default") {
      this.setBorderState("focus");
    }
  }

  // Handle input blur
  handleBlur(event) {
    if (!this.hasInputTarget || event.target !== this.inputTarget) return;

    this.isFocused = false;

    // Reset border state if appropriate
    if (["default", "focus"].includes(this.currentState)) {
      this.setBorderState("default");
    }

    // Save immediately if changes are pending
    if (this.pendingSave) {
      clearTimeout(this.timeout);
      this.saveData();
    }
  }

  // Handle input changes
  submit() {
    if (!this.hasInputTarget) return;

    const newValue = this.inputTarget.value.trim();

    // Skip if no change or empty
    if (newValue === "" || newValue === this.lastValue) return;

    // Update value and schedule save
    this.lastValue = newValue;

    // Clear existing timeout if any
    if (this.pendingSave) clearTimeout(this.timeout);

    this.pendingSave = true;
    this.timeout = setTimeout(() => this.saveData(), this.typingDelayValue);
  }

  // Save the data
  saveData() {
    if (!this.pendingSave || !this.hasInputTarget) return;

    // Update UI to show saving
    this.setBorderState("saving");

    // Send the data
    const url = this.formTarget.action;
    const formData = new FormData(this.formTarget);

    fetch(url, {
      method: "POST",
      body: formData,
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "X-Requested-With": "XMLHttpRequest",
      },
    })
      .then(() => {
        // Show saved state
        setTimeout(() => {
          this.setBorderState("saved");

          // Return to appropriate state after delay
          setTimeout(() => {
            this.setBorderState(this.isFocused ? "focus" : "default");
          }, this.savedDelayValue);
        }, this.savingDelayValue);
      })
      .catch((error) => {
        console.error("Error saving prediction:", error);
        this.setBorderState(this.isFocused ? "focus" : "default");
      });

    this.pendingSave = false;
  }

  // Set the border state
  setBorderState(state) {
    if (!this.hasInputTarget) return;

    // Store current state
    this.currentState = state;

    // Remove all border classes
    Object.values(this.borderStates)
      .flat()
      .forEach((cls) => this.inputTarget.classList.remove(cls));

    // Add new border classes
    this.borderStates[state].forEach((cls) =>
      this.inputTarget.classList.add(cls)
    );
  }
}
