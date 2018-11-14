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
        *wifi_status
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
4. Zip
      -- attributes
        *id
        *name



If necessary join table between users and Location

--User_Location
*id
*user_id
*location_id




11/14/2018

1. error exceptions for validations
  -- number checks  (making sure user choose correct numbers)
  --

2. how to set the default value of census_tract to 0

3. creatively display output

4. update animations

5. We need close program off for all n or quit responses

  result = []

  result << choice << street

  result = [1, "prospect street"]
6. Test faves
7. Test all options
