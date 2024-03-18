import nodemailer from 'nodemailer';
import * as handlebars from 'handlebars';

export async function sendMail({
	to,
	name,
	subject,
	body,
}: {
	to: string;
	name: string;
	subject: string;
	body: string;
}) {
	const { SMTP_EMAIL, SMTP_PASSWORD } = process.env;

	const transport = nodemailer.createTransport({
		host: process.env.MAILER_HOST,
		port: Number(process.env.MAILER_PORT),
		auth: {
			user: process.env.MAILER_AUTH_USER,
			pass: process.env.MAILER_AUTH_PASS,
		},
	});

	try {
		const testResult = await transport.verify();
		console.log(testResult);
	} catch (error) {
		console.error({ error });
		return;
	}

	const mailOptions = {
		from: process.env.FROM_EMAIL_ADDRESS,
		to,
		subject: 'Reset your password',
		html: body,
	};

	try {
		const sendResult = await transport.sendMail(mailOptions);
		console.log(sendResult);
	} catch (error) {
		console.log(error);
	}
}

export const compileTemplate = (template: string, data: any) => {
	const compiled = handlebars.compile(template);
	return compiled(data);
};
