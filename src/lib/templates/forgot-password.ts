export const forgotPassword = `
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8” />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Garden Materials Shop</title>
        <link
            rel="stylesheet"
            id="fonts-css"
            href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
            type="text/css"
            media="all"
        />
        <style>
            :root {
                --max-container-size: 71.25rem;
                --min-container-size: 13.5rem;
                --body-text-color: #4d4d4d;
                --border-color: #aa081e;
                --anchor-color: #d71a20;
                --background-color: #a1081c;
            }

            *,
            *::after,
            *::before {
                box-sizing: border-box;
                text-rendering: optimizeLegibility;
            }

            /* html {
                height: 100%;
            } */

            body {
                /* height: 100%;
                width: 100%; */
                font-family: 'Raleway', sans-serif;
                color: var(--body-text-color);
                font-size: 14px;
                line-height: normal;
                font-weight: normal;
                margin: 3rem 1rem;
            }

            ul,
            li,
            h1,
            h2,
            h3,
            h4 {
                margin: 0;
                padding: 0;
            }

            .h3,
            h3 {
                font-size: 24px;
            }

            li a {
                font-weight: bold;
                text-decoration: none;
            }

            a {
                text-decoration: none;
                -o-transition: 0.5s;
                -ms-transition: 0.5s;
                -moz-transition: 0.5s;
                -webkit-transition: 0.5s;
                transition: 0.5s;
                background-color: transparent;
                color: #d71a20;
            }

            .container {
                max-width: 980px;
                width: 98%;
                margin: 0 auto;
                outline: none;
            }

            .page_title {
                font-weight: 700;
                padding-bottom: 25px;
                margin-bottom: 15px;
                font-size: 25px;
                text-align: center;
            }

            h1.page_title:after {
                content: '';
                display: block;
                width: 120px;
                background: var(--background-color);
                margin: 0 auto;
                margin-top: 20px;
                border: 2px solid var(--border-color);
                border-radius: 25px;
            }

            .content_wrapper {
                padding: 0 15px;
                max-width: 75%;
                margin: 0 auto;
            }

            p {
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="page_title">Garden Materials Shop</h1>
            <h2 class="page_title">Reset Password</h2>
            <div class="content_wrapper">
                <p>
                    You are receiving this because you (or someone else) have
                    requested the reset of the password for your account
                </p>
                <p>
                    Please click on the following link, or paste this into your
                    browser to complete the process:
                </p>
                <p>
                    <a href="{{resetUrl}}"> {{resetLinkName}}</a>
                </p>
                <p>
                    If you did not request a password reset, no further action
                    is required.
                </p>
            </div>
        </div>
    </body>
</html>
`;
