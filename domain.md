# Model Domain

1. User Class
    -- attributes
      *ID
      *Name
      *Favs = []
    --  methods
      *start
        -summary of app
        -username
        -enter location if known
      *display_choices
        -Favs
        -Choose
        -Quit
      *show_fav
        -display array of favs
      *add_fav
        -add favs
        -return method
      *choose_method
        -pick boro
        -pick zip/town
      *see_more_method
        -show more options

2. Location
    -- attributes
        *Name
        *boro ID
        *zip ID
    -- Methods
        *display_method
        *retrieve_data
        *most_popular

3. Boro
      -- attributes
        *id
        *name
4. Zip-Code
      -- attributes
        *id
        *name



If necessary join table between users and Location

--User_Location
*id
*user_id
*location_id
