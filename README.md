## Snapr - Social photo messaging from the terminal

# Installation

1. Open the terminal.
2. Install Image Magick (version 6 required)

    ```
    brew install imagemagick@6
    ```

    ```
    brew link --force imagemagick@6
    ```
3. Install RMargick gem

    ```
    gem install rmagick    
    ```
3. Install Catpix gem

    ```
    gem install catpix    
    ```
4. Install Lolcommits gem

    ```
    gem install lolcommits    
    ```

# Instructions

For help, use:

    ```
    ruby snapr.rb 
    ```

To watch for chat images, use:

    ```
    ruby snapr.rb -watch    
    ```

To take and send a chat image, use:

    ```
    ruby snapr.rb "Hello everyone"    
    ```

