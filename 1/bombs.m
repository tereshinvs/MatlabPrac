function varargout = bombs(varargin)
% BOMBS MATLAB code for bombs.fig
%      BOMBS, by itself, creates a new BOMBS or raises the existing
%      singleton*.
%
%      H = BOMBS returns the handle to a new BOMBS or the handle to
%      the existing singleton*.
%
%      BOMBS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOMBS.M with the given input arguments.
%
%      BOMBS('Property','Value',...) creates a new BOMBS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bombs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bombs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bombs

% Last Modified by GUIDE v2.5 16-Sep-2013 09:39:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bombs_OpeningFcn, ...
                   'gui_OutputFcn',  @bombs_OutputFcn, ...
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


% --- Executes just before bombs is made visible.
function bombs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bombs (see VARARGIN)

% Choose default command line output for bombs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

xlabel('X');
ylabel('Y');

% UIWAIT makes bombs wait for user response (see UIRESUME)
% uiwait(handles.main_figure);


% --- Outputs from this function are returned to the command line.
function varargout = bombs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function xlim_edit_Callback(hObject, eventdata, handles)
% hObject    handle to xlim_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlim_edit as text
%        str2double(get(hObject,'String')) returns contents of xlim_edit as a double
    set(handles.laxes, 'XLim', [0 str2double(get(handles.xlim_edit, 'String'))]);


% --- Executes during object creation, after setting all properties.
function xlim_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlim_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylim_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ylim_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylim_edit as text
%        str2double(get(hObject,'String')) returns contents of ylim_edit as a double
    set(handles.laxes, 'YLim', [0 str2double(get(handles.ylim_edit, 'String'))]);


% --- Executes during object creation, after setting all properties.
function ylim_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylim_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in newpnt.
function newpnt_Callback(hObject, eventdata, handles)
% hObject    handle to newpnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [x, y] = ginput(1);
    plot(x, y, 'r*');


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.rad_slider, 'Enable', 'off');
    set(handles.start_button, 'Enable', 'off');
    set(handles.newpnt, 'Enable', 'off');
    set(handles.method_popup, 'Enable', 'off');
    set(handles.retry_button, 'Enable', 'on');
    
    set(handles.safe_zone_label, 'Visible', 'on');
    set(handles.safe_zone_r, 'Visible', 'on');
    set(handles.safe_zone_g, 'Visible', 'on');
    set(handles.safe_zone_b, 'Visible', 'on');
    set(handles.safe_button, 'Visible', 'on');
    set(handles.result_label, 'Visible', 'on');
    
    set(handles.expl_r, 'Enable', 'off');
    set(handles.expl_g, 'Enable', 'off');
    set(handles.expl_b, 'Enable', 'off');
    set(handles.alpha_slider, 'Enable', 'off');
    set(handles.width_popup, 'Enable', 'off');
    
    method = get(handles.method_popup, 'Value');
    vict = get_foreman_coord(method, get(handles.laxes, 'XLim'), get(handles.laxes, 'YLim'));
    rad = get(handles.rad_slider, 'Value');
    
    bombs = get(handles.laxes, 'Children');
    set(handles.result_label, 'String', get_foreman_status(bombs, vict, rad));
    
    N = size(bombs, 1);
    alpha = get(handles.alpha_slider, 'Value');
    r = str2double(get(handles.expl_r, 'String'));
    g = str2double(get(handles.expl_g, 'String'));
    b = str2double(get(handles.expl_b, 'String'));
    if any(isnan([r g b]))
        r = 1;
        g = 0;
        b = 0;
    end
    widths = [1, 2, 3];
    width_number = get(handles.width_popup, 'Value');
    line_width = widths(width_number);
    for i = 1 : N
        draw_fill_circle(get(bombs(i), 'XData'), get(bombs(i), 'YData'), rad, [r g b], alpha, line_width);
    end
    
    plot(vict(1), vict(2), 'g+', 'MarkerSize', 20);


% --- Executes on button press in retry_button.
function retry_button_Callback(hObject, eventdata, handles)
% hObject    handle to retry_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.rad_slider, 'Enable', 'on');
    set(handles.start_button, 'Enable', 'on');
    set(handles.newpnt, 'Enable', 'on');
    set(handles.method_popup, 'Enable', 'on');
    set(handles.retry_button, 'Enable', 'off');
    
    set(handles.safe_zone_label, 'Visible', 'off');
    set(handles.safe_zone_r, 'Visible', 'off');
    set(handles.safe_zone_g, 'Visible', 'off');
    set(handles.safe_zone_b, 'Visible', 'off');
    set(handles.safe_button, 'Visible', 'off');
    set(handles.result_label, 'Visible', 'off');
    
    set(handles.safe_zone_r, 'String', '');
    set(handles.safe_zone_g, 'String', '');
    set(handles.safe_zone_b, 'String', '');
    
    set(handles.expl_r, 'Enable', 'on');
    set(handles.expl_g, 'Enable', 'on');
    set(handles.expl_b, 'Enable', 'on');
    set(handles.alpha_slider, 'Enable', 'on');
    set(handles.width_popup, 'Enable', 'on');

    cla();
    set(handles.laxes, 'Color', [1 1 1]);


% --- Executes on selection change in method_popup.
function method_popup_Callback(hObject, eventdata, handles)
% hObject    handle to method_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method_popup


% --- Executes during object creation, after setting all properties.
function method_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function safe_zone_r_Callback(hObject, eventdata, handles)
% hObject    handle to safe_zone_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of safe_zone_r as text
%        str2double(get(hObject,'String')) returns contents of safe_zone_r as a double


% --- Executes during object creation, after setting all properties.
function safe_zone_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to safe_zone_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function safe_zone_g_Callback(hObject, eventdata, handles)
% hObject    handle to safe_zone_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of safe_zone_g as text
%        str2double(get(hObject,'String')) returns contents of safe_zone_g as a double


% --- Executes during object creation, after setting all properties.
function safe_zone_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to safe_zone_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function safe_zone_b_Callback(hObject, eventdata, handles)
% hObject    handle to safe_zone_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of safe_zone_b as text
%        str2double(get(hObject,'String')) returns contents of safe_zone_b as a double


% --- Executes during object creation, after setting all properties.
function safe_zone_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to safe_zone_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in safe_button.
function safe_button_Callback(hObject, eventdata, handles)
% hObject    handle to safe_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    r = str2double(get(handles.safe_zone_r, 'String'));
    g = str2double(get(handles.safe_zone_g, 'String'));
    b = str2double(get(handles.safe_zone_b, 'String'));
    set(handles.laxes, 'Color', [r, g, b]);


% --- Executes on slider movement.
function rad_slider_Callback(hObject, eventdata, handles)
% hObject    handle to rad_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function rad_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rad_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function expl_r_Callback(hObject, eventdata, handles)
% hObject    handle to expl_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expl_r as text
%        str2double(get(hObject,'String')) returns contents of expl_r as a double


% --- Executes during object creation, after setting all properties.
function expl_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expl_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function expl_g_Callback(hObject, eventdata, handles)
% hObject    handle to expl_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expl_g as text
%        str2double(get(hObject,'String')) returns contents of expl_g as a double


% --- Executes during object creation, after setting all properties.
function expl_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expl_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function expl_b_Callback(hObject, eventdata, handles)
% hObject    handle to expl_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expl_b as text
%        str2double(get(hObject,'String')) returns contents of expl_b as a double


% --- Executes during object creation, after setting all properties.
function expl_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expl_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function alpha_slider_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function alpha_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_slider (see GCBO	
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in width_popup.
function width_popup_Callback(hObject, eventdata, handles)
% hObject    handle to width_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns width_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from width_popup


% --- Executes during object creation, after setting all properties.
function width_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
