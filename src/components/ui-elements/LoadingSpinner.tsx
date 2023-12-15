import React from 'react';

import classes from './LoadingSpinner.module.css';

interface Props {
	asOverlay?: boolean;
}

const LoadingSpinner: React.FC<Props> = (props) => {
	return (
		<div
			className={`${props.asOverlay} && ${classes.loading_spinner_overlay}`}
		>
			<div className={classes.lds_dual_ring}></div>
		</div>
	);
};

export default LoadingSpinner;
