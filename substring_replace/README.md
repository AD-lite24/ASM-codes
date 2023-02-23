# Procedure

Here the substring to be identified is stored as a separate string. An equivalent of a nested loop is applied here (see ITER1 and ITER2). Various registers have been used to keep track of our indices while SI and DI are the primary pointers to our indices since they are used when using string operations.

When the substring is detected, it branches to another location which replaces the first charecter of the substring with the required charecter, and the shifts the remaining charecters (ie. the ones after 'IOT') to the left to replace the space held by the substring. This involves some basic math which should be worked out on paper for easier understanding (it was done to make the code somewhat modular, you can just as easily write your own value instead of working it out in code)

Note that the charecters are not shifted exactly but rather copied, so they do exist in their previous locations. However the objective has been achieved and clearing those is optional. 