<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Raku Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome to My Simple Raku Page!</h1>

    <p>
        Today is:
        <?raku
            #Get the current date and time
            use DateTime::Format;
            say strftime('%Y-%m-%d %H:%M:%S', DateTime.now);
        ?>
    </p>

    <p>
        Random number:
        <?raku
            #Generate a random number between 1 and 100
            say (^100).pick;
        ?>
    </p>
</div>

</body>
</html>
