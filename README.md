<img align="center" width="100" height="100" src="./images/flying_book.png">

This repo is a reading log. After reading a short story or a book, I add its vitals to `data.yml`. Running `bin/build` transforms that YAML into all the Html files in the `site` directory. To see the site in action, visit:

http://reading.marginchronicles.com.

---

If you're looking around the Ruby code you might start thinking _what the hell? There shouldn't be this much code to handle one YAML file!_ You're right! This static site generator is entirely over-engineered. There's no reason it needs to use the MVC pattern. I chose to overbuild it for two reasons:

1. I don't plan to change the code often, and I hope the rigid structure and some of the metaprogramming will make it easier to get reacclimated in the future.
2. To learn more about Ruby. Writing this site has forced me to implement features of Rails that I take for granted, like rendering a partial inside an ERB template or making view helpers available everywhere.

