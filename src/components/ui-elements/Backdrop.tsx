import React from 'react';
import ReactDOM from 'react-dom';

import classes from './Backdrop.module.css';

interface Props {
	onClick: () => void;
}

const Backdrop: React.FC<Props> = (props) => {
	return ReactDOM.createPortal(
		<div className={classes.backdrop} onClick={props.onClick}></div>,
		document.getElementById('backdrop-hook') as HTMLDivElement
	);
};

export default Backdrop;
