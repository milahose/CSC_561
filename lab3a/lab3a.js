use blogger

db.user.insert({
  _id: ObjectId("5bb26043708926e438db6cad"),
  firstname: "John",
  lastname: "Smith",
  email: "johnsmith@test.com",
  password: "$1$ilGhXQZi$PWavozQcabSeKTuzAHgHl0"
});

db.user.insert({
  _id: ObjectId("5bb26043708926e438db6cae"),
  firstname: "Sally",
  lastname: "Student",
  email: "sallystudent@test.com",
  password: "$1$ilGhXQZi$hYEg3it0mjtU.T7vElkiu"
});

db.user.insert({
  _id: ObjectId("5bb26043708926e438db6caf"),
  firstname: "Jane",
  lastname: "Doe",
  email: "janedoe@test.com",
  password: "$1$ilGhXQZi$lxXc5/nf47qeut39lU/aN1"
});

db.user.find().pretty();

db.user.find({
  _id: ObjectId("5bb26043708926e438db6cad")
}).pretty();

db.blog.insert({
  title: "A Really Cool Blog",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam varius faucibus erat nec tempor. Cras ultrices ante cursus metus tempus tincidunt. Nam pulvinar tortor ac est tristique auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla quis sollicitudin mauris. Fusce id sodales ante. Quisque at gravida enim. Integer magna purus, porttitor nec metus at, bibendum framework tincidunt sem. Pellentesque condimentum tortor ut nibh lacinia, id fermentum nulla sollicitudin. Suspendisse vitae velit at erat ullamcorper aliquet. Donec posuere facilisis commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac nunc fringilla, aliquet est vel, mollis.",
  slug: "A blog like no other",
  author: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cad") },
  comments: [
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cae") }, 
      comment: "Superb!", 
      approved: true, 
      created_at: '2021-05-23'
    },
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6caf") }, 
      comment: "Wow!", 
      approved: true, 
      created_at: '2021-01-30'
    }
  ],
  category: [
    {
      name: "Linux"
    }
  ]
});

db.blog.insert({
  title: "A Really Awesome Blog",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel erat vel dolor luctus aliquam. Praesent tincidunt sollicitudin condimentum. In semper tellus et aliquet dignissim. Nullam id felis pretium, consequat nunc dapibus, lacinia lectus. Mauris vel sagittis lectus. Vivamus tristique tincidunt magna sed venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam lectus eros, aliquam eu imperdiet nec, congue id orci. Proin lorem sapien, semper sed eros sit amet, aliquam tincidunt magna. Praesent vitae velit ut leo volutpat vehicula id sed odio. In id massa vel tellus facilisis condimentum a dignissim ex. Maecenas porta.",
  slug: "Too awesome to believe",
  author: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cae") },
  comments: [
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cad") }, 
      comment: "Nice!", 
      approved: true, 
      created_at: '2021-04-23'
    },
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6caf") }, 
      comment: "Cool!", 
      approved: true, 
      created_at: '2021-06-12'
    }
  ],
  category: [
    {
      name: "JavaScript"
    }
  ]
});

db.blog.insert({
  title: "A Really Interesting Blog",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac libero odio. Fusce elementum, leo nec porttitor pulvinar, nulla magna congue nisi, sed gravida ante turpis id lacus. Fusce ut rutrum dui, in congue justo. Praesent tellus ante, consequat non sollicitudin nec, euismod nec metus. Morbi lacinia, odio in sollicitudin vestibulum, lorem tellus mollis magna, et fringilla diam purus sed nunc. Curabitur purus lorem, cursus sit amet dictum a, semper in turpis. Mauris nec pretium dolor, at accumsan mauris. Quisque vel metus commodo, finibus justo sit amet, gravida enim. Quisque at volutpat ante. Morbi nulla est, lobortis pretium ex eu.",
  slug: "This is the most interesting topic ever",
  author: { $ref: "user", $id: ObjectId("5bb26043708926e438db6caf") },
  comments: [
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cae") }, 
      comment: "Super interesting!", 
      approved: true, 
      created_at: '2021-03-13'
    },
    {
      user_id: { $ref: "user", $id: ObjectId("5bb26043708926e438db6cad") }, 
      comment: "Informative!", 
      approved: true, 
      created_at: '2021-02-02'
    }
  ],
  category: [
    {
      name: "PHP"
    }
  ]
});

db.blog.find({
  "comments.user_id.$id": ObjectId("5bb26043708926e438db6caf"),
}, {
  category: 0,
  author: 0,
  body: 0,
  _id: 0,
  comments: 0
}).pretty();

db.blog.find({
  body: /framework/gi
}).pretty();

