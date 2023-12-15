import React, { LegacyRef } from 'react';
import { Editor } from '@tinymce/tinymce-react';
import { UseFormRegisterReturn } from 'react-hook-form';

type EditorProps = {
	id: string;
	initialValue: string;
	handleEditorChange: (content: string, editor: any) => void;
	register: Omit<UseFormRegisterReturn, 'ref'>;
};

const apiKey = process.env.NEXT_PUBLIC_TINYMCE_API_KEY;

const EditorComponent = React.forwardRef(
	({ id, initialValue, handleEditorChange, register }: EditorProps, ref) => (
		<Editor
			apiKey={apiKey}
			ref={ref as LegacyRef<Editor> | undefined}
			id={id}
			initialValue={initialValue}
			init={{
				height: 500,
				menubar: false,
				plugins: [
					'advlist autolink lists link image charmap print preview anchor',
					'searchreplace visualblocks code fullscreen',
					'insertdatetime media table paste code help wordcount',
				],
				toolbar:
					'undo redo | formatselect | bold italic backcolor | \
                    alignleft aligncenter alignright alignjustify | \
                    bullist numlist outdent indent | removeformat | help',
			}}
			onEditorChange={handleEditorChange}
			{...register}
		/>
	)
);

EditorComponent.displayName = 'EditorComponent'; // Add display name

export default EditorComponent;
