## User Stories
```
> 1. As a time-pressed user
> So that I can quickly go to web sites I regularly visit
> I would like to see a list of bookmarks


> 2. As a time-pressed user
> So that I can save a website for later visits
>I would like to add the site's address and title to bookmark manager

> 3. As a time-pressed user
> So that I can no longer view an unwanted website
> I would like to delete an unwanted bookmark from bookmark manager

> 4. As a time-pressed user
> So that the bookmark can show updated information  
> I would like to be able update a bookmark with new information in bookmark manager

> 5. As a time-pressed user
> So that I can add a description to the bookmark
> I would like to add a comment to a bookmark from bookmark manager

> 6. As a time-pressed user
> So that I can groupd bookmarks according to their categories
> I would like to tag bookmarks into categories from bookmark manager

> 7. As a time-pressed user
> So that I can visit a particular category of websites
> I would like to show / filter bookmarks by their category tags

```

## Database
```
1. Connect to psql
>> psql

2. Create the database using the psql command
>> CREATE DATABASE bookmark_manager;

3. Connect to the database using the pqsl command
>> \c bookmark_manager;

4. Run the query we have saved in the file
>> db/migrations/01_create_bookmarks_table.sql
```

Using PG gem to connect ruby application to the Postgre SQL database
```
```
# Additional Funcationalities
```
1. Adding CSS

2. Adding <a> function to bookmark links

```



Setting up a testing env apart from the dev env

> if ENV['ENVIRONMENT'] == 'test'
>   connection = PG.connect(dbname: 'bookmark_manager_test')
>  else 
>   connection = PG.connect(dbname: 'bookmark_manager')
>  end
```
