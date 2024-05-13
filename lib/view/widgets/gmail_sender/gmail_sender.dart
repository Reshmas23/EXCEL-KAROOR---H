// class GmailModel {
//   List<String> to;

// }
import 'dart:developer';

import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';

projectGmailSender(
    {required String subjectHeading,
    required String textmessage,
    required List<String> sendingmails}) async {
  try {
    Map<String, dynamic> emailData = {
      'to': sendingmails,
      'message': {
        'subject': subjectHeading,
        'text': 'This is the plaintext section of the email body.',
        'html': '''
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 20px;
        }

        h1 {
            color: #3498db;
        }

        p {
            margin-bottom: 15px;
        }

        .details {
            background-color: #f2f2f2;
            padding: 10px;
            border-radius: 5px;
        }

        .signature {
            margin-top: 20px;
            font-style: italic;
            color: #7f8c8d;
        }
    </style>
</head>

<body>
    <h1>Congratulations on successfully creating your account with Vidyaveechi at MTHSS Tuition Center!</h1>

    <p>Here are your account details:</p>

    <div class="details">
        <p><strong>Email:</strong> abinjohn8089@gmail.com</p>
        <p><strong>Password:</strong> qwerty</p>
    </div>

    <p>Thank you for joining us! If you have any questions or need assistance, feel free to reach out.</p>

    <p class="signature">Best regards,<br>[Your Name]<br>Vidyaveechi - MTHSS Tuition Center</p>
</body>

</html>
''',
      },
      'attachments': {
        'filename': 'imagefile.png',
        'path':
            'https://firebasestorage.googleapis.com/v0/b/leptondujokerala.appspot.com/o/images%2F1686732900296?alt=media&token=dfe86cf8-fe9e-4d5c-bedc-d42df918bbe7'
      }
    };
    server.collection("EmailDocumentCollection").add(emailData).then(
      (value) {
        log("Queued email for delivery!");
      },
    ).catchError(
      (error) {
        log("Error sending email: $error");
      },
    );
  } catch (e) {
    log("Gmail Failed  ${e.toString()}");
  }
}
