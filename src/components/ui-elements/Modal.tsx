import React from 'react';
import ReactDOM from 'react-dom';
import { CSSTransition } from 'react-transition-group';

import Backdrop from './Backdrop';
import classes from './Modal.module.css';

interface Props {
	show: boolean;
	className?: string;
	headerClass?: string;
	contentClass?: string;
	footerClass?: string;
	style?: React.CSSProperties;
	onCancel: () => void;
	onSubmit?: (event: React.FormEvent<HTMLFormElement>) => void;
	header?: string;
	footer?: React.ReactNode;
	children?: React.ReactNode;
}

const ModalOverlay: React.FC<Props> = (props) => {
	const content = (
		<div
			className={`${classes.modal} ${props?.className}`}
			style={props.style}
		>
			<span
				className={classes.close}
				data-dismiss='modal'
				aria-label='Close'
				onClick={props.onCancel}
			>
				<span aria-hidden='true'>×</span>
			</span>
			<header className={`${classes.modal__header} ${props.headerClass}`}>
				<h2>{props.header}</h2>
			</header>
			<form
				onSubmit={
					props.onSubmit
						? props.onSubmit
						: (event) => event.preventDefault()
				}
			>
				<div
					className={`${classes.modal__content} ${props.contentClass}`}
				>
					{props.children}
				</div>
			</form>
			<footer className={`${classes.modal__footer} ${props.footerClass}`}>
				{props.footer}
			</footer>
		</div>
	);
	return ReactDOM.createPortal(
		content,
		document.getElementById('modal-hook') as HTMLElement
	);
};

const Modal: React.FC<Props> = (props) => {
	return (
		<React.Fragment>
			{props.show && <Backdrop onClick={props.onCancel} />}
			<CSSTransition
				in={props.show}
				timeout={200}
				classNames='modal'
				mountOnEnter
				unmountOnExit
			>
				<ModalOverlay {...props} />
			</CSSTransition>
		</React.Fragment>
	);
};

export default Modal;
