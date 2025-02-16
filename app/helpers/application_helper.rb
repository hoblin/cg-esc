module ApplicationHelper
  def primary_button_class
    "rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 dark:bg-blue-500 dark:hover:bg-blue-400 text-white inline-block font-medium cursor-pointer"
  end

  def secondary_button_class
    "rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-900 dark:text-gray-100 inline-block font-medium cursor-pointer"
  end

  def icon_button(text, icon_name, url, button_class)
    link_to url, class: button_class do
      safe_join([
        phosphor_icon(icon_name, class: "h-5 w-5 inline mr-1"),
        text
      ])
    end
  end

  def form_label_class
    "text-sm font-medium text-gray-500 dark:text-gray-400"
  end

  def form_input_class(errors)
    [
      "block shadow-sm rounded-md border outline-hidden px-3 py-2 mt-2 w-full bg-white dark:bg-gray-700 text-gray-900 dark:text-gray-100",
      {
        "border-gray-400 focus:outline-blue-600": errors.none?,
        "border-red-400 focus:outline-red-600": errors.any?
      }
    ]
  end

  def form_static_value_class
    "block px-3 py-2 mt-2 text-gray-700 dark:text-gray-300"
  end

  def form_container_class
    "bg-white dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-gray-700 p-6"
  end

  def form_checkbox_class(errors)
    [
      "shadow-sm rounded border outline-hidden mt-2 h-5 w-5 bg-white dark:bg-gray-700 text-blue-600",
      {
        "border-gray-400 focus:outline-blue-600": errors.none?,
        "border-red-400 focus:outline-red-600": errors.any?
      }
    ]
  end
end
