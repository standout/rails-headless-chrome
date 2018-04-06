class HelloWorldController < ApplicationController
  def index
    render inline: "<h1>Hello</h1><script>document.querySelector('h1').innerText += ', World!'</script>"
  end
end
