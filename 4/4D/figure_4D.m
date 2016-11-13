function varargout = figure_4D(varargin)
% FIGURE_4D MATLAB code for figure_4D.fig
%      FIGURE_4D, by itself, creates a new FIGURE_4D or raises the existing
%      singleton*.
%
%      H = FIGURE_4D returns the handle to a new FIGURE_4D or the handle to
%      the existing singleton*.
%
%      FIGURE_4D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURE_4D.M with the given input arguments.
%
%      FIGURE_4D('Property','Value',...) creates a new FIGURE_4D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figure_4D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figure_4D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figure_4D

% Last Modified by GUIDE v2.5 14-Nov-2013 17:27:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figure_4D_OpeningFcn, ...
                   'gui_OutputFcn',  @figure_4D_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before figure_4D is made visible.
function figure_4D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figure_4D (see VARARGIN)

% Choose default command line output for figure_4D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figure_4D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = figure_4D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function alpha_edit_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_edit as text
%        str2double(get(hObject,'String')) returns contents of alpha_edit as a double


% --- Executes during object creation, after setting all properties.
function alpha_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function draw(alpha, handles)
	args = -1.1 : 0.05 : 1.1;
	[x, y, z] = meshgrid(args, args, args);
	v = f(x, y, z, alpha);
	
	%axis tight;
	camlight;
	lighting phong;
	%shading flat;
	
	fv = isosurface(x, y, z, v, 1.0);
	p = patch(fv);
	isonormals(x, y, z, v, p);
	edge_color = 'black';
	if get(handles.invisible_check, 'Value') == 1
		edge_color = 'none';
	end
	face_color = [1, 0, 0];
	face_color_num = get(handles.facecolor_popup, 'Value');
	if face_color_num == 2
		face_color = [0, 1, 0];
	end
	if face_color_num == 3
		face_color = [0, 0, 1];
	end
	set(p, 'FaceColor', face_color, 'EdgeColor', edge_color, 'FaceAlpha', get(handles.alpha_popup, 'Value') / 5.0);
	daspect([1, 1, 1]);
	view(3);


% --- Executes on button press in draw_button.
function draw_button_Callback(hObject, eventdata, handles)
% hObject    handle to draw_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	cla();
	alpha = str2double(get(handles.alpha_edit, 'String'));
	if strcmp(get(handles.alpha_edit, 'String'), 'Inf') == 1
		alpha = Inf;
	end
	draw(alpha, handles);


% --- Executes on button press in check_1_2.
function check_1_2_Callback(hObject, eventdata, handles)
% hObject    handle to check_1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_1_2


% --- Executes on button press in check_1.
function check_1_Callback(hObject, eventdata, handles)
% hObject    handle to check_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_1


% --- Executes on button press in check_2.
function check_2_Callback(hObject, eventdata, handles)
% hObject    handle to check_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_2


% --- Executes on button press in check_4.
function check_4_Callback(hObject, eventdata, handles)
% hObject    handle to check_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_4


% --- Executes on button press in check_inf.
function check_inf_Callback(hObject, eventdata, handles)
% hObject    handle to check_inf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_inf

function draw_several(handles)
	hold on;
	if get(handles.check_1_2, 'Value') == 1
		draw(0.5, handles);
	end
	if get(handles.check_1, 'Value') == 1
		draw(1.0, handles);
	end
	if get(handles.check_2, 'Value') == 1
		draw(2.0, handles);
	end
	if get(handles.check_4, 'Value') == 1
		draw(4, handles);
	end
	if get(handles.check_inf, 'Value') == 1
		draw(Inf, handles);
	end

% --- Executes on button press in draw_several_button.
function draw_several_button_Callback(hObject, eventdata, handles)
% hObject    handle to draw_several_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	cla();
	draw_several(handles);
	

% --- Executes on selection change in alpha_popup.
function alpha_popup_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns alpha_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from alpha_popup
	cla();
	draw_several(handles);

% --- Executes during object creation, after setting all properties.
function alpha_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in invisible_check.
function invisible_check_Callback(hObject, eventdata, handles)
% hObject    handle to invisible_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of invisible_check
	cla();
	draw_several(handles);


% --- Executes on selection change in facecolor_popup.
function facecolor_popup_Callback(hObject, eventdata, handles)
% hObject    handle to facecolor_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns facecolor_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from facecolor_popup
	cla();
	draw_several(handles);


% --- Executes during object creation, after setting all properties.
function facecolor_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to facecolor_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
