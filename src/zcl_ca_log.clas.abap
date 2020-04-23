"! <p class="shorttext synchronized" lang="en">Common object: Application log (BAL)</p>
CLASS zcl_ca_log DEFINITION PUBLIC
                            CREATE PUBLIC.

* P U B L I C   S E C T I O N
  PUBLIC SECTION.

*   i n t e r f a c e s
    INTERFACES:
      if_xo_const_message,
      if_fsbp_const_range,
      zif_ca_c_bool,
      zif_ca_c_log_techn,
      zif_ca_c_log.

*   a l i a s e s
    ALIASES:
*     Boolean flags
      c_false              FOR zif_ca_c_bool~c_false,
      c_true               FOR zif_ca_c_bool~c_true,
*     Message types
      c_msgty_a            FOR if_xo_const_message~abort,
      c_msgty_e            FOR if_xo_const_message~error,
      c_msgty_i            FOR if_xo_const_message~info,
      c_msgty_s            FOR if_xo_const_message~success,
      c_msgty_w            FOR if_xo_const_message~warning,
      c_msgty_x            FOR if_xo_const_message~exit,
*     Object category Ids for key LPOR
      c_catid_cl           FOR zif_ca_c_log~c_catid_cl,
      c_catid_bo           FOR zif_ca_c_log~c_catid_bo,
*     Problem classes
      c_probclass_def      FOR zif_ca_c_log~c_probclass_def,
      c_probclass_imp      FOR zif_ca_c_log~c_probclass_imp,
      c_probclass_info     FOR zif_ca_c_log~c_probclass_info,
      c_probclass_undef    FOR zif_ca_c_log~c_probclass_undef,
      c_probclass_vimp     FOR zif_ca_c_log~c_probclass_vimp,
*     Operation modes
      c_mode_batch         FOR zif_ca_c_log~c_mode_batch,
      c_mode_dialog        FOR zif_ca_c_log~c_mode_dialog,
      c_mode_batch_input   FOR zif_ca_c_log~c_mode_batch_input.

*   s t a t i c   m e t h o d s
    CLASS-METHODS:
      "! <p class="shorttext synchronized" lang="en">Display one or more saved application logs</p>
      "!
      "! @parameter io_parent      | <p class="shorttext synchronized" lang="en">Parent container to display log in-place</p>
      "! @parameter iv_title       | <p class="shorttext synchronized" lang="en">Application Log: Dynpro Title</p>
      "! @parameter iv_lognumber   | <p class="shorttext synchronized" lang="en">Application log: log number</p>
      "! @parameter it_lognumber   | <p class="shorttext synchronized" lang="en">Application Log: Log Number Table</p>
      "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">1 = Display as popup</p>
      "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">1 = Display source code positions</p>
      "! @parameter is_profile     | <p class="shorttext synchronized" lang="en">Profile with settings log output / display</p>
      display_for_lognr
        IMPORTING
          io_parent      TYPE REF TO cl_gui_container OPTIONAL
          iv_title       TYPE baltitle OPTIONAL
          iv_lognumber   TYPE balognr OPTIONAL
          it_lognumber   TYPE bal_t_logn OPTIONAL
          iv_popup       TYPE dml_boolean DEFAULT c_false
          iv_disp_srcpos TYPE dml_boolean DEFAULT c_false
          is_profile     TYPE bal_s_prof OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Display all logs for reference object and key</p>
      "!
      "! @parameter io_parent      | <p class="shorttext synchronized" lang="en">Parent container to display log in-place</p>
      "! @parameter iv_title       | <p class="shorttext synchronized" lang="en">Application Log: Dynpro Title</p>
      "! @parameter iv_objtype     | <p class="shorttext synchronized" lang="en">Object type</p>
      "! @parameter iv_objkey      | <p class="shorttext synchronized" lang="en">Object key</p>
      "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">1 = Display as popup</p>
      "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">1 = Display source code positions</p>
      "! @parameter is_profile     | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
      display_for_refobj
        IMPORTING
          io_parent      TYPE REF TO cl_gui_container OPTIONAL
          iv_title       TYPE baltitle OPTIONAL
          iv_objtype     TYPE swo_objtyp
          iv_objkey      TYPE csequence
          iv_popup       TYPE dml_boolean DEFAULT c_false
          iv_disp_srcpos TYPE dml_boolean DEFAULT c_false
          is_profile     TYPE bal_s_prof OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Get instance from buffer (use only if multiple inst. needed)</p>
      "!
      "! <p>Use this method only if multiple instances are required. This is e. g. the case for workflow objects
      "! (classes and business objects) or for mass processing like in data migration programs.</p>
      "! <p>The key structure IS_LPOR can be used as you like as long as it meets the uniqueness as required. If it
      "! is in use for workflow or archiving purposes it is recommended to pass a fully qualified key. Use for field
      "! CATID the constants C_CATID_*).</p>
      "!
      "! @parameter iv_object        | <p class="shorttext synchronized" lang="en">Application Log: Object Name (Application Code)</p>
      "! @parameter iv_subobj        | <p class="shorttext synchronized" lang="en">Application Log: Subobject</p>
      "! @parameter is_lpor          | <p class="shorttext synchronized" lang="en">Business object/class key - BOR Compatible</p>
      "! @parameter iv_extnumber     | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
      "! @parameter iv_repid         | <p class="shorttext synchronized" lang="en">ABAP Program: Current Main Program</p>
      "! @parameter iv_tcode         | <p class="shorttext synchronized" lang="en">ABAP System Field: Current Transaction Code</p>
      "! @parameter iv_def_msgid     | <p class="shorttext synchronized" lang="en">Default message class</p>
      "! @parameter iv_def_probclass | <p class="shorttext synchronized" lang="en">Default problem class (use const. C_PROBCLAS_*)</p>
      "! @parameter iv_mode          | <p class="shorttext synchronized" lang="en">Application Log: Operating mode  (use const. C_MODE_*)</p>
      "! @parameter iv_del_before    | <p class="shorttext synchronized" lang="en">Application Log: Keep log until expiry</p>
      "! @parameter iv_del_date      | <p class="shorttext synchronized" lang="en">Application Log: Expiration Date</p>
      "! @parameter ro_log           | <p class="shorttext synchronized" lang="en">Common object: Application log (BAL)</p>
      get_instance_from_buffer
        IMPORTING
          iv_object        TYPE balobj_d
          iv_subobj        TYPE balsubobj
          is_lpor          TYPE sibflporb
          iv_extnumber     TYPE balnrext OPTIONAL
          VALUE(iv_repid)  TYPE syrepid DEFAULT sy-cprog
          VALUE(iv_tcode)  TYPE syst_tcode DEFAULT sy-tcode
          iv_def_msgid     TYPE symsgid OPTIONAL
          iv_def_probclass TYPE balprobcl DEFAULT c_probclass_vimp
          iv_mode          TYPE balmode DEFAULT 'D'
          iv_del_before    TYPE dml_boolean DEFAULT c_false
          iv_del_date      TYPE aldate_del OPTIONAL
        RETURNING
          VALUE(ro_log)    TYPE REF TO zcl_ca_log,

      "! <p class="shorttext synchronized" lang="en">Release buffered instances</p>
      "!
      "! @parameter is_lpor      | <p class="shorttext synchronized" lang="en">Business object/class key - BOR Compatible</p>
      delete_from_buffer
        IMPORTING
          is_lpor TYPE sibflporb,

      "! <p class="shorttext synchronized" lang="en">Release buffered instances</p>
      free_buffer,

      "! <p class="shorttext synchronized" lang="en">Get list of logs for ref object</p>
      "!
      "! @parameter iv_objtype | <p class="shorttext synchronized" lang="en">Object type</p>
      "! @parameter iv_objkey  | <p class="shorttext synchronized" lang="en">Object key</p>
      "! @parameter rt_lognr   | <p class="shorttext synchronized" lang="en">Application Log: Log Number Table</p>
      get_log_list_for_refobj
        IMPORTING
          iv_objtype      TYPE swo_objtyp
          iv_objkey       TYPE csequence
        RETURNING
          VALUE(rt_lognr) TYPE bal_t_logn.

*   i n s t a n c e   m e t h o d s
    METHODS:
      "! <p class="shorttext synchronized" lang="en">Add single message using message variables</p>
      "!
      "! @parameter iv_msgty     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
      "! @parameter iv_msgid     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message ID</p>
      "! @parameter iv_msgno     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Number</p>
      "! @parameter iv_msgv1     | <p class="shorttext synchronized" lang="en">Message variable 1</p>
      "! @parameter iv_msgv2     | <p class="shorttext synchronized" lang="en">Message variable 2</p>
      "! @parameter iv_msgv3     | <p class="shorttext synchronized" lang="en">Message variable 3</p>
      "! @parameter iv_msgv4     | <p class="shorttext synchronized" lang="en">Message variable 4</p>
      "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
      "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
      "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      add_msg
        IMPORTING
          iv_msgty     TYPE syst_msgty DEFAULT c_msgty_e
          iv_msgid     TYPE syst_msgid OPTIONAL
          iv_msgno     TYPE syst_msgno DEFAULT '000'
          iv_msgv1     TYPE csequence OPTIONAL
          iv_msgv2     TYPE csequence OPTIONAL
          iv_msgv3     TYPE csequence OPTIONAL
          iv_msgv4     TYPE csequence OPTIONAL
          iv_probclass TYPE balprobcl OPTIONAL
          iv_detlevel  TYPE ballevel OPTIONAL
          is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add message from structure BAL_S_MSG</p>
      "!
      "! @parameter is_msg    | <p class="shorttext synchronized" lang="en">Application Log: Message Data</p>
      "! @parameter is_srcpos | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      add_msg_bal
        IMPORTING
          is_msg    TYPE bal_s_msg
          is_srcpos TYPE zca_s_excep_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add messages from tabletype ACO_TT_BAL_MSG</p>
      "!
      "! @parameter it_msg | <p class="shorttext synchronized" lang="en">Message Log</p>
      add_msg_bal_tab
        IMPORTING
          it_msg TYPE aco_tt_bal_msg,

      "! <p class="shorttext synchronized" lang="en">Add message from structure BAPIRET2</p>
      "!
      "! @parameter is_bapiret2  | <p class="shorttext synchronized" lang="en">Return Parameter</p>
      "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
      "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
      "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      add_msg_bapiret2
        IMPORTING
          is_bapiret2  TYPE bapiret2
          iv_probclass TYPE balprobcl OPTIONAL
          iv_detlevel  TYPE ballevel OPTIONAL
          is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add messages from tabletype BAPIRET2_T</p>
      "!
      "! @parameter it_bapiret2  | <p class="shorttext synchronized" lang="en">Return table</p>
      "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
      "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
      "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      add_msg_bapiret2_tab
        IMPORTING
          it_bapiret2  TYPE bapiret2_t
          iv_probclass TYPE balprobcl OPTIONAL
          iv_detlevel  TYPE ballevel OPTIONAL
          is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add message from exception class</p>
      "!
      "! @parameter ix_excep     | <p class="shorttext synchronized" lang="en">Catched exception</p>
      "! @parameter iv_all       | <p class="shorttext synchronized" lang="en">1 = Append all previous messages</p>
      "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
      "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
      add_msg_exc
        IMPORTING
          ix_excep     TYPE REF TO cx_root
          iv_all       TYPE dml_boolean DEFAULT c_false
          iv_probclass TYPE balprobcl OPTIONAL
          iv_detlevel  TYPE ballevel OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add message from structure SYST</p>
      "!
      "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
      "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
      "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      add_msg_syst
        IMPORTING
          iv_probclass TYPE balprobcl OPTIONAL
          iv_detlevel  TYPE ballevel OPTIONAL
          is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Add reference object and key</p>
      "!
      "! @parameter iv_objtype | <p class="shorttext synchronized" lang="en">Object type</p>
      "! @parameter iv_objkey  | <p class="shorttext synchronized" lang="en">Object key</p>
      add_ref
        IMPORTING
          iv_objtype TYPE swo_objtyp
          iv_objkey  TYPE csequence,

      "! <p class="shorttext synchronized" lang="en">Close log</p>
      close,

      "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
      "!
      "! @parameter iv_object        | <p class="shorttext synchronized" lang="en">Application Log: Object Name (Application Code)</p>
      "! @parameter iv_subobj        | <p class="shorttext synchronized" lang="en">Application Log: Subobject</p>
      "! @parameter iv_extnumber     | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
      "! @parameter iv_repid         | <p class="shorttext synchronized" lang="en">ABAP Program: Current Main Program</p>
      "! @parameter iv_tcode         | <p class="shorttext synchronized" lang="en">ABAP System Field: Current Transaction Code</p>
      "! @parameter iv_def_msgid     | <p class="shorttext synchronized" lang="en">Default message class</p>
      "! @parameter iv_def_probclass | <p class="shorttext synchronized" lang="en">Default problem class (use const. C_PROBCLAS_*)</p>
      "! @parameter iv_mode          | <p class="shorttext synchronized" lang="en">Application Log: Operating mode  (use const. C_MODE_*)</p>
      "! @parameter iv_del_before    | <p class="shorttext synchronized" lang="en">Application Log: Keep log until expiry</p>
      "! @parameter iv_del_date      | <p class="shorttext synchronized" lang="en">Application Log: Expiration Date</p>
      constructor
        IMPORTING
          iv_object        TYPE balobj_d
          iv_subobj        TYPE balsubobj
          iv_extnumber     TYPE balnrext OPTIONAL
          VALUE(iv_repid)  TYPE syrepid DEFAULT sy-cprog
          VALUE(iv_tcode)  TYPE syst_tcode DEFAULT sy-tcode
          iv_def_msgid     TYPE symsgid OPTIONAL
          iv_def_probclass TYPE balprobcl DEFAULT c_probclass_vimp
          iv_mode          TYPE balmode DEFAULT c_mode_dialog
          iv_del_before    TYPE dml_boolean DEFAULT c_false
          iv_del_date      TYPE aldate_del OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Display log</p>
      "!
      "! @parameter iv_use_grid    | <p class="shorttext synchronized" lang="en">1 = Display as grid</p>
      "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">1 = Display as popup</p>
      "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">1 = Display source code position of exception</p>
      "! @parameter iv_show_all    | <p class="shorttext synchronized" lang="en">1 = Show all messages</p>
      "! @parameter is_profile     | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
      display
        IMPORTING
          iv_use_grid    TYPE dml_boolean DEFAULT c_true
          iv_popup       TYPE dml_boolean DEFAULT c_false
          iv_disp_srcpos TYPE dml_boolean DEFAULT c_false
          iv_show_all    TYPE dml_boolean DEFAULT c_false
          is_profile     TYPE bal_s_prof  OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Get number of all BAL messages depending on message type</p>
      "!
      "! @parameter iv_msgty  | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
      "! @parameter rv_result | <p class="shorttext synchronized" lang="en">Number of message found</p>
      get_msg_count
        IMPORTING
          iv_msgty         TYPE syst_msgty OPTIONAL
        RETURNING
          VALUE(rv_result) TYPE i,

      "! <p class="shorttext synchronized" lang="en">Get all messages from BAL (table type ACO_TT_BAL_MSG)</p>
      "!
      "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
      "! @parameter rt_data  | <p class="shorttext synchronized" lang="en">Message Log</p>
      get_msg_list_bal
        IMPORTING
          iv_msgty       TYPE symsgty OPTIONAL
        RETURNING
          VALUE(rt_data) TYPE aco_tt_bal_msg,

      "! <p class="shorttext synchronized" lang="en">Get messages from BAL and convert into BAPIRET2 format</p>
      "!
      "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
      "! @parameter rt_data  | <p class="shorttext synchronized" lang="en">Return table</p>
      get_msg_list_bapiret2
        IMPORTING
          iv_msgty       TYPE symsgty OPTIONAL
        RETURNING
          VALUE(rt_data) TYPE bapiret2_t,

      "! <p class="shorttext synchronized" lang="en">Get prepared display profile</p>
      "!
      "! @parameter iv_use_grid    | <p class="shorttext synchronized" lang="en">1 = Display as grid</p>
      "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">1 = Display as popup</p>
      "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">1 = Display source code position of exception</p>
      "! @parameter iv_show_all    | <p class="shorttext synchronized" lang="en">1 = Show all messages</p>
      "! @parameter rs_prof        | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
      get_profile
        IMPORTING
          iv_use_grid    TYPE dml_boolean DEFAULT c_true
          iv_popup       TYPE dml_boolean DEFAULT c_false
          iv_disp_srcpos TYPE dml_boolean DEFAULT c_false
          iv_show_all    TYPE dml_boolean DEFAULT c_false
        RETURNING
          VALUE(rs_prof) TYPE bal_s_prof,

      "! <p class="shorttext synchronized" lang="en">Get current external number</p>
      "!
      "! @parameter rv_extnumber | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
      get_ext_number
        RETURNING
          VALUE(rv_extnumber) TYPE balnrext,

      "! <p class="shorttext synchronized" lang="en">Save all messages (optional with CLOSE)</p>
      "!
      "! @parameter iv_close       | <p class="shorttext synchronized" lang="en">1 = Close log</p>
      "! @parameter iv_commit      | <p class="shorttext synchronized" lang="en">1 = Execute commit work</p>
      "! @parameter iv_in_upd_task | <p class="shorttext synchronized" lang="en">1 = Save log in update task</p>
      "! @parameter iv_no_empty    | <p class="shorttext synchronized" lang="en">1 = Do not save empty logs</p>
      "! @parameter rv_lognumber   | <p class="shorttext synchronized" lang="en">Application log: log number</p>
      save
        IMPORTING
          iv_close            TYPE dml_boolean DEFAULT c_true
          iv_commit           TYPE dml_boolean DEFAULT c_true
          iv_in_upd_task      TYPE dml_boolean DEFAULT c_false
          iv_no_empty         TYPE dml_boolean DEFAULT c_true
            PREFERRED PARAMETER iv_close
        RETURNING
          VALUE(rv_lognumber) TYPE balognr,

      "! <p class="shorttext synchronized" lang="en">Set source code position to message</p>
      "!
      "! @parameter is_msgh   | <p class="shorttext synchronized" lang="en">Application Log: Message handle</p>
      "! @parameter is_srcpos | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
      set_source_position
        IMPORTING
          is_msgh   TYPE balmsghndl
          is_srcpos TYPE zca_s_excep_srcpos,

      "! <p class="shorttext synchronized" lang="en">Set new external number</p>
      "!
      "! @parameter iv_extnumber | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
      set_ext_number
        IMPORTING
          iv_extnumber TYPE balnrext,

      "! <p class="shorttext synchronized" lang="en">Write all messages (use of WRITE command)</p>
      "!
      "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
      write
        IMPORTING
          iv_msgty TYPE syst_msgty OPTIONAL.


* P R O T E C T E D   S E C T I O N
  PROTECTED SECTION.
*   a l i a s e s
    ALIASES:
*     Sign and options
      c_sign_i                FOR  if_fsbp_const_range~sign_include,
      c_opt_eq                FOR  if_fsbp_const_range~option_equal,
*     Problem classes
      c_fname_s_excep_srcpos  FOR zif_ca_c_log_techn~c_fname_s_excep_srcpos,
      c_fname_class           FOR zif_ca_c_log_techn~c_fname_class,
      c_fname_method          FOR zif_ca_c_log_techn~c_fname_method,
      c_fname_line            FOR zif_ca_c_log_techn~c_fname_line.

*   c o n s t a n t s
    CONSTANTS:
      "! <p class="shorttext synchronized" lang="en">Name function module: Call back for read of source position</p>
      c_fm_name_cb_read       TYPE rs38l_fnam        VALUE 'Z_CA_LOG_CB_READ'  ##no_text,
      "! <p class="shorttext synchronized" lang="en">Name function module: Call back to handle user commands</p>
      c_fm_name_cb_ucom       TYPE rs38l_fnam        VALUE 'Z_CA_LOG_CB_UCOM'  ##no_text,
      "! <p class="shorttext synchronized" lang="en">Name function module: Call back to pass source positions</p>
      c_fm_name_cb_set_srcpos TYPE rs38l_fnam        VALUE 'Z_CA_LOG_CB_SET_SRCPOS'  ##no_text.

*   i n s t a n c e   a t t r i b u t e s
    DATA:
*     t a b l e s
      "! <p class="shorttext synchronized" lang="en">Common object: Application log - Business object reference</p>
      mt_objref        TYPE zca_tt_log_objref,
      "! <p class="shorttext synchronized" lang="en">Common object: Application log - Source code position</p>
      mt_srcpos        TYPE zca_tt_log_srcpos,

*     s t r u c t u r e s
      "! <p class="shorttext synchronized" lang="en">Application Log: Log header data</p>
      ms_log           TYPE bal_s_log,

*     s i n g l e   v a l u e s
      "! <p class="shorttext synchronized" lang="en">Default message class</p>
      mv_def_msgid     TYPE symsgid,
      "! <p class="shorttext synchronized" lang="en">Default message problem class</p>
      mv_def_probclass TYPE balprobcl,
      "! <p class="shorttext synchronized" lang="en">Application Log: Log Handle</p>
      mv_loghndl       TYPE balloghndl.

*   s t a t i c   m e t h o d s
    CLASS-METHODS:
      "! <p class="shorttext synchronized" lang="en">Add message to log</p>
      "!
      "! @parameter iv_loghndl | <p class="shorttext synchronized" lang="en">Application Log: Log Handle</p>
      "! @parameter is_msg     | <p class="shorttext synchronized" lang="en">Application Log: Message Data</p>
      "! @parameter rs_msgh    | <p class="shorttext synchronized" lang="en">Application Log: Message handle</p>
      intern_add_message
        IMPORTING
          iv_loghndl     TYPE balloghndl
          is_msg         TYPE bal_s_msg
        RETURNING
          VALUE(rs_msgh) TYPE balmsghndl,

      "! <p class="shorttext synchronized" lang="en">Create new log</p>
      "!
      "! @parameter is_log     | <p class="shorttext synchronized" lang="en">Application Log: Log header data</p>
      "! @parameter rv_loghndl | <p class="shorttext synchronized" lang="en">Application Log: Log Handle</p>
      intern_create
        IMPORTING
          is_log            TYPE bal_s_log
        RETURNING
          VALUE(rv_loghndl) TYPE balloghndl,

      "! <p class="shorttext synchronized" lang="en">Display log</p>
      "!
      "! @parameter io_parent | <p class="shorttext synchronized" lang="en">Parent container to display log in-place</p>
      "! @parameter is_prof   | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
      "! @parameter it_logh   | <p class="shorttext synchronized" lang="en">Application Log: Log Handle Table</p>
      "! @parameter it_msgh   | <p class="shorttext synchronized" lang="en">Application Log: Message Handle Table</p>
      "! @parameter it_srcpos | <p class="shorttext synchronized" lang="en">Common object: Application log - Source code position</p>
      intern_display
        IMPORTING
          io_parent TYPE REF TO cl_gui_container OPTIONAL
          is_prof   TYPE bal_s_prof
          it_logh   TYPE bal_t_logh
          it_msgh   TYPE bal_t_msgh OPTIONAL
          it_srcpos TYPE zca_tt_log_srcpos OPTIONAL,

      "! <p class="shorttext synchronized" lang="en">Get lognr from loghandle</p>
      "!
      "! @parameter iv_log_handle | <p class="shorttext synchronized" lang="en">Application Log: Log Handle</p>
      "! @parameter rv_lognr      | <p class="shorttext synchronized" lang="en">Application log: log number</p>
      intern_get_lognr_from_handle
        IMPORTING
          iv_log_handle   TYPE balloghndl
        RETURNING
          VALUE(rv_lognr) TYPE balognr,

      "! <p class="shorttext synchronized" lang="en">Get display profile</p>
      "!
      "! @parameter iv_title       | <p class="shorttext synchronized" lang="en">Application Log: Dynpro Title</p>
      "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">1 = Display as popup</p>
      "! @parameter iv_use_grid    | <p class="shorttext synchronized" lang="en">1 = Display as grid</p>
      "! @parameter iv_report      | <p class="shorttext synchronized" lang="en">Program for saving layout variant</p>
      "! @parameter iv_show_all    | <p class="shorttext synchronized" lang="en">1 = Show all messages</p>
      "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">1 = Display source code position of exception</p>
      "! @parameter it_srcpos      | <p class="shorttext synchronized" lang="en">Common object: Application log - Source code position</p>
      "! @parameter rs_prof        | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
      intern_get_profile
        IMPORTING
          iv_title       TYPE baltitle OPTIONAL
          iv_popup       TYPE dml_boolean DEFAULT c_false
          iv_use_grid    TYPE dml_boolean DEFAULT c_true
          iv_report      TYPE syrepid OPTIONAL
          iv_show_all    TYPE dml_boolean DEFAULT c_false
          iv_disp_srcpos TYPE dml_boolean DEFAULT c_false
          it_srcpos      TYPE zca_tt_log_srcpos OPTIONAL
        RETURNING
          VALUE(rs_prof) TYPE bal_s_prof,

      "! <p class="shorttext synchronized" lang="en">Load log</p>
      "!
      "! @parameter it_lhdr   | <p class="shorttext synchronized" lang="en">Application Log: Log header data table</p>
      "! @parameter et_logh   | <p class="shorttext synchronized" lang="en">Application Log: Log Handle Table</p>
      "! @parameter et_msgh   | <p class="shorttext synchronized" lang="en">Application Log: Message Handle Table</p>
      "! @parameter et_srcpos | <p class="shorttext synchronized" lang="en">Common object: Application log - Source code position</p>
      intern_load
        IMPORTING
          it_lhdr   TYPE balhdr_t
        EXPORTING
          et_logh   TYPE bal_t_logh
          et_msgh   TYPE bal_t_msgh
          et_srcpos TYPE zca_tt_log_srcpos,

      "! <p class="shorttext synchronized" lang="en">Load exception positions</p>
      "!
      "! @parameter it_msgh   | <p class="shorttext synchronized" lang="en">Application Log: Message Handle Table</p>
      "! @parameter rt_srcpos | <p class="shorttext synchronized" lang="en">Common object: Application log - Source code position</p>
      intern_load_pos
        IMPORTING
          it_msgh          TYPE bal_t_msgh
        RETURNING
          VALUE(rt_srcpos) TYPE zca_tt_log_srcpos,

      "! <p class="shorttext synchronized" lang="en">Read log message</p>
      "!
      "! @parameter is_msgh | <p class="shorttext synchronized" lang="en">Application Log: Message handle</p>
      "! @parameter rs_msg  | <p class="shorttext synchronized" lang="en">Application Log: Message Data</p>
      intern_msg_read
        IMPORTING
          is_msgh       TYPE balmsghndl
        RETURNING
          VALUE(rs_msg) TYPE bal_s_msg,

      "! <p class="shorttext synchronized" lang="en">Refresh memory</p>
      "!
      "! @parameter iv_loghndl | <p class="shorttext synchronized" lang="en">Application Log: Log Handle</p>
      intern_refresh
        IMPORTING
          iv_loghndl TYPE balloghndl,

      "! <p class="shorttext synchronized" lang="en">Save log</p>
      "!
      "! @parameter it_logh        | <p class="shorttext synchronized" lang="en">Application Log: Log Handle Table</p>
      "! @parameter iv_in_upd_task | <p class="shorttext synchronized" lang="en">1 = Save log in update task</p>
      "! @parameter rt_lgnm        | <p class="shorttext synchronized" lang="en">Application Log: Newly-Assigned LOGNUMBER Table</p>
      intern_save
        IMPORTING
          it_logh        TYPE bal_t_logh
          iv_in_upd_task TYPE dml_boolean DEFAULT c_false
        RETURNING
          VALUE(rt_lgnm) TYPE bal_t_lgnm,

      "! <p class="shorttext synchronized" lang="en">Search log</p>
      "!
      "! @parameter is_lfil | <p class="shorttext synchronized" lang="en">Application Log: Log filter criteria</p>
      "! @parameter rt_lhdr | <p class="shorttext synchronized" lang="en">Application Log: Log header data table</p>
      intern_search
        IMPORTING
          is_lfil        TYPE bal_s_lfil
        RETURNING
          VALUE(rt_lhdr) TYPE balhdr_t.

*   i n s t a n c e   m e t h o d s
    METHODS:
      "! <p class="shorttext synchronized" lang="en">Check log is opened?</p>
      is_open,

      "! <p class="shorttext synchronized" lang="en">Save error positions with lognr</p>
      "!
      "! @parameter iv_lognr   | <p class="shorttext synchronized" lang="en">Application log: log number</p>
      "! @parameter rv_changed | <p class="shorttext synchronized" lang="en">1 = Messages are saved</p>
      intern_save_srcpos
        IMPORTING
          iv_lognr          TYPE balognr
        RETURNING
          VALUE(rv_changed) TYPE dml_boolean,

      "! <p class="shorttext synchronized" lang="en">Save ref objects with lognr</p>
      "!
      "! @parameter iv_lognr   | <p class="shorttext synchronized" lang="en">Application log: log number</p>
      "! @parameter rv_changed | <p class="shorttext synchronized" lang="en">1 = Messages are saved</p>
      intern_save_logref
        IMPORTING
          iv_lognr          TYPE balognr
        RETURNING
          VALUE(rv_changed) TYPE dml_boolean.


* P R I V A T E   S E C T I O N
  PRIVATE SECTION.
*   l o c a l   t y p e   d e f i n i t i o n
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Buffered instance</p>
      BEGIN OF ty_s_buffer.
        INCLUDE TYPE sibflporb AS s_key.
      TYPES:
        o_log TYPE REF TO zcl_ca_log,
      END   OF ty_s_buffer,
      "! <p class="shorttext synchronized" lang="en">Instance buffer</p>
      ty_t_buffer TYPE SORTED TABLE OF ty_s_buffer
                                       WITH UNIQUE KEY s_key.

*   s t a t i c   a t t r i b u t e s
    CLASS-DATA:
*     t a b l e s
      "! <p class="shorttext synchronized" lang="en">Instance buffer</p>
      mt_buffer     TYPE ty_t_buffer.

ENDCLASS.



CLASS zcl_ca_log IMPLEMENTATION.

  METHOD add_msg.
    "-----------------------------------------------------------------*
    "   Add single message using message variables
    "-----------------------------------------------------------------*
    me->add_msg_bal( is_srcpos = is_srcpos
                     is_msg    = VALUE #( msgid     = iv_msgid
                                          msgty     = iv_msgty
                                          msgno     = iv_msgno
                                          msgv1     = iv_msgv1
                                          msgv2     = iv_msgv2
                                          msgv3     = iv_msgv3
                                          msgv4     = iv_msgv4
                                          probclass = iv_probclass
                                          detlevel  = iv_detlevel ) ).
  ENDMETHOD.                    "add_msg


  METHOD add_msg_bal.
    "-----------------------------------------------------------------*
    "   Add message from structure BAL_S_MSG
    "-----------------------------------------------------------------*
    "Is log open/created?
    me->is_open( ).

    DATA(ls_msg) = is_msg.

    IF ls_msg-msgid IS INITIAL.
      "use default message ID
      ls_msg-msgid = me->mv_def_msgid.
    ENDIF.

    IF ls_msg-probclass IS INITIAL.
      "use default message problem class
      ls_msg-probclass = me->mv_def_probclass.
    ENDIF.

    "add message
    DATA(ls_msgh) = intern_add_message( iv_loghndl = me->mv_loghndl
                                        is_msg     = ls_msg ).

    "set error position
    me->set_source_position( is_msgh   = ls_msgh
                             is_srcpos = is_srcpos ).
  ENDMETHOD.                    "add_msg_bal


  METHOD add_msg_bal_tab.
    "-----------------------------------------------------------------*
    "   Add messages from tabletype ACO_TT_BAL_MSG
    "-----------------------------------------------------------------*
    LOOP AT it_msg ASSIGNING FIELD-SYMBOL(<ls_msg>).
      me->add_msg_bal( <ls_msg> ).
    ENDLOOP.
  ENDMETHOD.                    "add_msg_bal_tab


  METHOD add_msg_bapiret2.
    "-----------------------------------------------------------------*
    "   Add message from structure BAPIRET2
    "-----------------------------------------------------------------*
    me->add_msg( iv_msgty     = is_bapiret2-type
                 iv_msgid     = is_bapiret2-id
                 iv_msgno     = is_bapiret2-number
                 iv_msgv1     = is_bapiret2-message_v1
                 iv_msgv2     = is_bapiret2-message_v2
                 iv_msgv3     = is_bapiret2-message_v3
                 iv_msgv4     = is_bapiret2-message_v4
                 iv_probclass = iv_probclass
                 iv_detlevel  = iv_detlevel
                 is_srcpos    = is_srcpos ).
  ENDMETHOD.                    "add_msg_bapiret2


  METHOD add_msg_bapiret2_tab.
    "-----------------------------------------------------------------*
    "   Add messages from tabletype BAPIRET2_T
    "-----------------------------------------------------------------*
    LOOP AT it_bapiret2 ASSIGNING FIELD-SYMBOL(<ls_bapiret2>).
      "add message
      me->add_msg_bapiret2( is_bapiret2  = <ls_bapiret2>
                            iv_probclass = iv_probclass
                            iv_detlevel  = iv_detlevel
                            is_srcpos    = is_srcpos ).
    ENDLOOP.
  ENDMETHOD.                    "add_msg_bapiret2_tab


  METHOD add_msg_exc.
    "-----------------------------------------------------------------*
    "   Add message from exception class
    "-----------------------------------------------------------------*
    DATA(lx_prev) = ix_excep.
    WHILE lx_prev IS BOUND.
      "Get message details and source code position
      DATA(ls_return) = zcx_ca_error=>get_msg_details_from_excep( lx_prev ).
      "Set source code position
      DATA(ls_srcpos) = zcx_ca_error=>get_exception_position( lx_prev ).

      "Use message type if provided
      CASE TYPE OF lx_prev.
        WHEN TYPE zcx_ca_error INTO DATA(lx_catched).
          ls_return-type = lx_catched->mv_msgty.
        WHEN TYPE zcx_ca_intern INTO DATA(lx_intern).
          ls_return-type = lx_intern->mv_msgty.
      ENDCASE.

      "Set problem class
      IF iv_probclass IS NOT INITIAL.
        DATA(lv_probclass) = iv_probclass.

      ELSE.
        IF ls_return-type IS INITIAL.
          lv_probclass = me->mv_def_probclass.

        ELSE.
          CASE ls_return-type.
            WHEN c_msgty_s.
              lv_probclass = c_probclass_info.

            WHEN c_msgty_i OR c_msgty_w.
              lv_probclass = c_probclass_def.

            WHEN c_msgty_e.
              lv_probclass = c_probclass_imp.

            WHEN c_msgty_a OR c_msgty_x.
              lv_probclass = c_probclass_vimp.
          ENDCASE.
        ENDIF.
      ENDIF.

      "Set missing message type depending on problem class
      IF ls_return-type IS INITIAL.

        CASE lv_probclass.
          WHEN c_probclass_info   OR
               c_probclass_undef.
            ls_return-type = c_msgty_s.

          WHEN c_probclass_def.
            ls_return-type = c_msgty_i.

          WHEN c_probclass_imp.
            ls_return-type = c_msgty_e.

          WHEN c_probclass_vimp.
            ls_return-type = c_msgty_a.
        ENDCASE.
      ENDIF.

      "add message to log
      me->add_msg( iv_msgid     = ls_return-id
                   iv_msgty     = ls_return-type
                   iv_msgno     = ls_return-number
                   iv_msgv1     = ls_return-message_v1
                   iv_msgv2     = ls_return-message_v2
                   iv_msgv3     = ls_return-message_v3
                   iv_msgv4     = ls_return-message_v4
                   iv_probclass = lv_probclass
                   iv_detlevel  = iv_detlevel
                   is_srcpos    = ls_srcpos ).

      IF iv_all EQ c_false.
        EXIT.
      ENDIF.

      lx_prev = lx_prev->previous.
    ENDWHILE.
  ENDMETHOD.                    "add_msg_exc


  METHOD add_msg_syst.
    "-----------------------------------------------------------------*
    "   Add message from structure SYST
    "-----------------------------------------------------------------*
    me->add_msg( iv_msgid     = sy-msgid
                 iv_msgty     = sy-msgty
                 iv_msgno     = sy-msgno
                 iv_msgv1     = sy-msgv1
                 iv_msgv2     = sy-msgv2
                 iv_msgv3     = sy-msgv3
                 iv_msgv4     = sy-msgv4
                 iv_probclass = iv_probclass
                 iv_detlevel  = iv_detlevel
                 is_srcpos    = is_srcpos  ).
  ENDMETHOD.                    "add_msg_sy


  METHOD add_ref.
    "-----------------------------------------------------------------*
    "   Add a object and key reference, e. g. in case of logging
    "   for several objects during one background run.
    "-----------------------------------------------------------------*
    IF iv_objtype IS INITIAL OR
       iv_objkey  IS INITIAL.
      "Parameter '&1' is not specified
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>param_not_supplied
          mv_msgty = c_msgty_e
          mv_msgv1 = 'OBJTYPE or OBJKEY'(e01).
    ENDIF.

    IF NOT line_exists( me->mt_objref[ objtype = iv_objtype
                                       objkey  = iv_objkey ] ).
      APPEND VALUE #( objtype = iv_objtype
                      objkey  = iv_objkey ) TO me->mt_objref.
    ENDIF.
  ENDMETHOD.                    "add_ref


  METHOD close.
    "-----------------------------------------------------------------*
    "   Close log
    "-----------------------------------------------------------------*
    "log already closed?
    IF me->ms_log IS INITIAL.
      RETURN.
    ENDIF.

    CLEAR me->ms_log.

    "refresh memory
    intern_refresh( me->mv_loghndl ).
  ENDMETHOD.                    "close


  METHOD constructor.
    "-----------------------------------------------------------------*
    "   Constructor
    "-----------------------------------------------------------------*
    "Is deletion date valid
    IF   iv_del_before EQ c_true   AND
       ( iv_del_date   IS INITIAL   OR
         iv_del_date   LT sy-datlo ).
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>del_date_invalid
          mv_msgty = c_msgty_e
          mv_msgv1 = CONV #( |{ iv_del_date DATE = USER }| ).
    ENDIF.

    "Keep global log settings
    me->mv_def_msgid      = iv_def_msgid.     "Default message class
    me->mv_def_probclass  = iv_def_probclass. "Default problem class

    me->ms_log-object     = iv_object.        "Object type (e. g. BUS2012 or self-defined)
    me->ms_log-subobject  = iv_subobj.        "Sub object
    me->ms_log-extnumber  = iv_extnumber.     "External identifier
    me->ms_log-alprog     = iv_repid.         "Program name
    me->ms_log-aluser     = sy-uname.         "Current user
    me->ms_log-altcode    = iv_tcode.         "Transaction code
    me->ms_log-almode     = iv_mode.          "Processing mode (Dialog, Batch, Batch-Input)
    me->ms_log-del_before = xsdbool( iv_del_before EQ c_true ).    "Keep log until deletion date
    me->ms_log-aldate_del = iv_del_date.      "Deletion date

    "Open new log
    me->mv_loghndl = intern_create( me->ms_log ).
  ENDMETHOD.                    "constructor


  METHOD delete_from_buffer.
    "-----------------------------------------------------------------*
    "   Delete a single instance
    "-----------------------------------------------------------------*
    READ TABLE mt_buffer ASSIGNING FIELD-SYMBOL(<ls_buffer>)
                         WITH KEY primary_key COMPONENTS s_key = is_lpor.
    IF sy-subrc EQ 0.
      <ls_buffer>-o_log->close( ).
      DELETE TABLE mt_buffer FROM <ls_buffer>.
    ENDIF.
  ENDMETHOD.                    "delete_from_buffer


  METHOD display.
    "-----------------------------------------------------------------*
    "   Display current messages
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      ls_prof              TYPE bal_s_prof.

    IF is_profile IS SUPPLIED.
      "use imported profile
      ls_prof = is_profile.
    ELSE.
      "get display profile
      ls_prof = me->get_profile( iv_popup       = iv_popup
                                 iv_use_grid    = iv_use_grid
                                 iv_disp_srcpos = iv_disp_srcpos
                                 iv_show_all    = iv_show_all ).
    ENDIF.

    "display logs
    intern_display( is_prof   = ls_prof
                    it_logh   = VALUE #( ( me->mv_loghndl ) )
                    it_srcpos = me->mt_srcpos ).
  ENDMETHOD.                    "display


  METHOD display_for_lognr.
    "-----------------------------------------------------------------*
    "   Display one or more saved application logs
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      ls_lfil        TYPE bal_s_lfil,
      ls_prof        TYPE bal_s_prof,
      lv_disp_srcpos TYPE dml_boolean.

    IF iv_lognumber          IS INITIAL AND
       lines( it_lognumber ) EQ 0.
      "Parameter error occurred
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>at_least_one
          mv_msgty = c_msgty_e
          mv_msgv1 = 'IV_LOGNUMBER'
          mv_msgv2 = 'IT_LOGNUMBER' ##no_text.
    ENDIF.

    "Set filter criteria
    IF iv_lognumber IS NOT INITIAL.
      APPEND VALUE bal_s_logn( sign   = c_sign_i
                               option = c_opt_eq
                               low    = iv_lognumber ) TO ls_lfil-lognumber.
    ENDIF.

    LOOP AT it_lognumber INTO DATA(lv_lognr).
      APPEND VALUE bal_s_logn( sign   = c_sign_i
                               option = c_opt_eq
                               low    = lv_lognr ) TO ls_lfil-lognumber.
    ENDLOOP.

    "Search logs
    DATA(lt_lhdr) = intern_search( ls_lfil ).

    "Load BAL messages
    intern_load(
            EXPORTING
              it_lhdr   = lt_lhdr
            IMPORTING
              et_logh   = DATA(lt_logh)
              et_msgh   = DATA(lt_msgh)
              et_srcpos = DATA(lt_srcpos) ).

    "Provide display profile
    IF is_profile IS NOT INITIAL.
      "Use imported profile
      ls_prof = is_profile.

    ELSE.
      "Decide if techn. source position should be displayed
      IF iv_disp_srcpos IS SUPPLIED.
        lv_disp_srcpos = iv_disp_srcpos.

      ELSE.
        lv_disp_srcpos = c_false.
        AUTHORITY-CHECK OBJECT 'S_DEVELOP'
          ID 'DEVCLASS' DUMMY
          ID 'OBJTYPE'  DUMMY
          ID 'OBJNAME'  DUMMY
          ID 'P_GROUP'  DUMMY
          ID 'ACTVT'    FIELD '03'.
        IF sy-subrc EQ 0.
          lv_disp_srcpos = c_true.
        ENDIF.
      ENDIF.

      "Get display profile
      READ TABLE lt_lhdr INTO DATA(ls_lhdr)
                         INDEX 1.
      ls_prof = intern_get_profile(
                         iv_title       = iv_title
                         iv_popup       = iv_popup
                         iv_use_grid    = c_true
                         "in case of one log - open all messages
                         iv_show_all    = COND dml_boolean( WHEN lines( lt_lhdr ) EQ 1
                                                              THEN c_true
                                                              ELSE c_false )
                         iv_report      = ls_lhdr-alprog
                         iv_disp_srcpos = lv_disp_srcpos
                         it_srcpos      = lt_srcpos ).
    ENDIF.

    "Display logs
    intern_display( io_parent = io_parent
                    is_prof   = ls_prof
                    it_logh   = lt_logh
                    it_msgh   = lt_msgh
                    it_srcpos = lt_srcpos ).

    "Remove log
    LOOP AT lt_logh ASSIGNING FIELD-SYMBOL(<lv_hndl>).
      intern_refresh( <lv_hndl> ).
    ENDLOOP.
  ENDMETHOD.                    "display_for_lognr


  METHOD display_for_refobj.
    "-----------------------------------------------------------------*
    "   Display all logs for reference object and key
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      lv_title TYPE baltitle.

    "Set window title
    IF iv_title IS NOT INITIAL.
      lv_title = iv_title.
    ELSE.
      "TEXT-T01 = Log(s) for object / TEXT-T02 = with key
      lv_title = condense( |{ TEXT-t01 } { iv_objtype } { TEXT-t02 } { iv_objkey }| ).
    ENDIF.

    "Read log number for object type and key
    DATA(lt_lognr) = get_log_list_for_refobj( iv_objtype = iv_objtype
                                              iv_objkey  = iv_objkey ).

    "Display all logs
    display_for_lognr( io_parent      = io_parent
                       iv_title       = lv_title
                       it_lognumber   = lt_lognr
                       iv_popup       = iv_popup
                       iv_disp_srcpos = iv_disp_srcpos
                       is_profile     = is_profile ).
  ENDMETHOD.                    "display_for_refobj


  METHOD free_buffer.
    "-----------------------------------------------------------------*
    "   Release buffered instances
    "-----------------------------------------------------------------*
    LOOP AT mt_buffer ASSIGNING FIELD-SYMBOL(<ls_buffer>).
      <ls_buffer>-o_log->close( ).
    ENDLOOP.

    FREE mt_buffer.
  ENDMETHOD.                    "free_buffer


  METHOD get_ext_number.
    "-----------------------------------------------------------------*
    "   Get display profile
    "-----------------------------------------------------------------*
    rv_extnumber = me->ms_log-extnumber.
  ENDMETHOD.                    "get_ext_number


  METHOD get_instance_from_buffer.
    "-----------------------------------------------------------------*
    "   Get instance from buffer (use only if multiple inst. needed),
    "   e. g. for workflow object instances or mass processing
    "-----------------------------------------------------------------*
    IF is_lpor-instid IS INITIAL OR
       is_lpor-typeid IS INITIAL OR
       is_lpor-catid  IS INITIAL.
      "Parameter '&1' has invalid value '&2'
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>param_invalid
          mv_msgty = c_msgty_e
          mv_msgv1 = 'IS_LPOR'
          mv_msgv2 = 'space' ##no_text.
    ENDIF.

    READ TABLE mt_buffer INTO DATA(ls_buffer)
                         WITH KEY s_key = is_lpor.
    IF sy-subrc NE 0.
      ls_buffer = VALUE ty_s_buffer(
                            s_key = is_lpor
                            o_log = NEW #( iv_object        = iv_object
                                           iv_subobj        = iv_subobj
                                           iv_extnumber     = iv_extnumber
                                           iv_def_msgid     = iv_def_msgid
                                           iv_def_probclass = iv_def_probclass
                                           iv_mode          = iv_mode ) ).
      INSERT ls_buffer INTO TABLE mt_buffer.
    ENDIF.

    ro_log = ls_buffer-o_log.
  ENDMETHOD.                    "get_instance_from_buffer


  METHOD get_log_list_for_refobj.
    "-----------------------------------------------------------------*
    "   Get list of logs for ref object
    "-----------------------------------------------------------------*
    SELECT lognr INTO  TABLE rt_lognr
                 FROM  zca_log_objref
                 WHERE objtype EQ iv_objtype
                   AND objkey  EQ iv_objkey.
    IF sy-subrc NE 0.
      "No entry exists for & in Table &
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>no_entry
          mv_msgty = c_msgty_e
          mv_msgv1 = 'ZCA_LOG_OBJREF'
          mv_msgv2 = CONV #( condense( |OBJTYPE: { iv_objtype }| ) )
          mv_msgv3 = CONV #( condense( |OBJKEY: { iv_objkey }| ) ) ##no_text.
    ENDIF.
  ENDMETHOD.                    "get_log_list_for_refobj


  METHOD get_msg_count.
    "-----------------------------------------------------------------*
    "   Get number of all BAL messages depending on message type
    "-----------------------------------------------------------------*
    TRY.
        rv_result = lines( me->get_msg_list_bapiret2( iv_msgty ) ).

      CATCH zcx_ca_log.
        rv_result = 0.
    ENDTRY.
  ENDMETHOD.                    "get_msg_count


  METHOD get_msg_list_bal.
    "-----------------------------------------------------------------*
    "   Get all messages from BAL (table type ACO_TT_BAL_MSG)
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      lt_msgh TYPE bal_t_msgh.

    CALL FUNCTION 'BAL_GLB_SEARCH_MSG'
      EXPORTING
        i_t_log_handle = VALUE bal_t_logh( ( me->mv_loghndl ) )
        i_s_msg_filter = VALUE bal_s_mfil(
                                  msgty = COND #(
                                            WHEN iv_msgty IS INITIAL
                                              THEN VALUE #( )  "initial filter
                                              ELSE VALUE #( ( sign   = c_sign_i
                                                              option = c_opt_eq
                                                              low    = iv_msgty ) ) ) )
      IMPORTING
        e_t_msg_handle = lt_msgh
      EXCEPTIONS
        msg_not_found  = 1
        OTHERS         = 2.
    IF sy-subrc NE 0.
      DATA(lx_error) =
             CAST zcx_ca_log( zcx_ca_intern=>create_exception(
                                    iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                    iv_function  = 'BAL_GLB_SEARCH_MSG'
                                    iv_subrc     = sy-subrc ) ) ##no_text.
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.

    LOOP AT lt_msgh ASSIGNING FIELD-SYMBOL(<lv_msgh>).
      APPEND intern_msg_read( <lv_msgh> ) TO rt_data.
    ENDLOOP.
  ENDMETHOD.                    "get_msg_list_bal


  METHOD get_msg_list_bapiret2.
    "-----------------------------------------------------------------*
    "   Get messages from BAL and convert into BAPIRET2 format
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      ls_bapiret2 TYPE bapiret2.

    DATA(lt_msg) = me->get_msg_list_bal( iv_msgty ).

    LOOP AT lt_msg ASSIGNING FIELD-SYMBOL(<ls_msg>).
      CALL FUNCTION 'BALW_BAPIRETURN_GET2'
        EXPORTING
          type   = <ls_msg>-msgty
          cl     = <ls_msg>-msgid
          number = <ls_msg>-msgno
          par1   = <ls_msg>-msgv1
          par2   = <ls_msg>-msgv2
          par3   = <ls_msg>-msgv3
          par4   = <ls_msg>-msgv4
        IMPORTING
          return = ls_bapiret2.

      APPEND ls_bapiret2 TO rt_data.
    ENDLOOP.
  ENDMETHOD.                    "get_msg_list_bapiret2


  METHOD get_profile.
    "-----------------------------------------------------------------*
    "   Get display profile
    "-----------------------------------------------------------------*
    rs_prof = intern_get_profile( iv_popup       = iv_popup
                                  iv_use_grid    = iv_use_grid
                                  iv_report      = me->ms_log-alprog
                                  iv_disp_srcpos = iv_disp_srcpos
                                  iv_show_all    = iv_show_all
                                  it_srcpos      = me->mt_srcpos ).
  ENDMETHOD.                    "get_display_profile


  METHOD intern_add_message.
    "-----------------------------------------------------------------*
    "   Add message to BAL
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = iv_loghndl
        i_s_msg          = is_msg
      IMPORTING
        e_s_msg_handle   = rs_msgh
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                      iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                      iv_function = 'BAL_LOG_MSG_ADD' ##no_text
                                      iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_add_message


  METHOD intern_create.
    "-----------------------------------------------------------------*
    "   Create BAL instance
    "-----------------------------------------------------------------*
    "neues Log öffnen
    CALL FUNCTION 'BAL_LOG_CREATE'
      EXPORTING
        i_s_log                 = is_log
      IMPORTING
        e_log_handle            = rv_loghndl
      EXCEPTIONS
        log_header_inconsistent = 1
        OTHERS                  = 2.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                              iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                              iv_function = 'BAL_LOG_CREATE' ##no_text
                                              iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_create


  METHOD intern_display.
    "-----------------------------------------------------------------*
    "   Display BAL for log object with display profile
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      lx_error             TYPE REF TO zcx_ca_log.

    "Set source pos. data into global data of call back function group (= CB)
    IF is_prof-clbk_read-userexitf EQ c_fm_name_cb_read.
      CALL FUNCTION 'Z_CA_LOG_CB_SET_SRCPOS'
        EXPORTING
          it_srcpos = it_srcpos.
    ENDIF.

    IF io_parent IS BOUND.
      "Display log in-place
      CALL FUNCTION 'BAL_CNTL_CREATE'
        EXPORTING
          i_container          = io_parent
          i_s_display_profile  = is_prof
          i_t_log_handle       = it_logh
          i_t_msg_handle       = it_msgh
        EXCEPTIONS
          profile_inconsistent = 1
          internal_error       = 2
          OTHERS               = 3.
      IF sy-subrc NE 0.
        lx_error = CAST zcx_ca_log(
                       zcx_ca_intern=>create_exception(
                                        iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                        iv_function = 'BAL_CNTL_CREATE'
                                        iv_subrc    = sy-subrc ) )  ##no_text.
        IF lx_error IS BOUND.
          RAISE EXCEPTION lx_error.
        ENDIF.
      ENDIF.

    ELSEIF it_msgh IS     SUPPLIED AND
           it_msgh IS NOT INITIAL.
      CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
        EXPORTING
          i_s_display_profile  = is_prof
          i_t_log_handle       = it_logh
          i_t_msg_handle       = it_msgh
        EXCEPTIONS
          profile_inconsistent = 1
          internal_error       = 2
          no_data_available    = 3
          no_authority         = 4
          OTHERS               = 5.
      IF sy-subrc NE 0.
        lx_error = CAST zcx_ca_log(
                       zcx_ca_intern=>create_exception(
                                        iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                        iv_function = 'BAL_DSP_LOG_DISPLAY' ##no_text
                                        iv_subrc    = sy-subrc ) ).
        IF lx_error IS BOUND.
          RAISE EXCEPTION lx_error.
        ENDIF.
      ENDIF.

    ELSE.
      CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
        EXPORTING
          i_s_display_profile  = is_prof
          i_t_log_handle       = it_logh
        EXCEPTIONS
          profile_inconsistent = 1
          internal_error       = 2
          no_data_available    = 3
          no_authority         = 4
          OTHERS               = 5.
      IF sy-subrc NE 0.
        lx_error = CAST zcx_ca_log(
                       zcx_ca_intern=>create_exception(
                                        iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                        iv_function = 'BAL_DSP_LOG_DISPLAY' ##no_text
                                        iv_subrc    = sy-subrc ) ).
        IF lx_error IS BOUND.
          RAISE EXCEPTION lx_error.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_display


  METHOD intern_get_lognr_from_handle.
    "-----------------------------------------------------------------*
    "   Get BAL log number from handle
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_LOG_HDR_READ'
      EXPORTING
        i_log_handle  = iv_log_handle
      IMPORTING
        e_lognumber   = rv_lognr
      EXCEPTIONS
        log_not_found = 1
        OTHERS        = 2.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                         zcx_ca_intern=>create_exception(
                                            iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                            iv_function = 'BAL_LOG_HDR_READ' ##no_text
                                            iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_get_lognr_from_handle


  METHOD intern_get_profile.
    "-----------------------------------------------------------------*
    "   Get display profile
    "-----------------------------------------------------------------*
    IF iv_popup EQ c_true.
      "Display as popup for selection by user
      CALL FUNCTION 'BAL_DSP_PROFILE_POPUP_GET'
        IMPORTING
          e_s_display_profile = rs_prof.

    ELSE.
      "Single log default
      CALL FUNCTION 'BAL_DSP_PROFILE_SINGLE_LOG_GET'
        IMPORTING
          e_s_display_profile = rs_prof.
    ENDIF.

    "Set several values to control layout of log display
    rs_prof-show_all = xsdbool( iv_show_all EQ c_true ).
    rs_prof-use_grid = xsdbool( iv_use_grid EQ c_true ).

    rs_prof-disvariant-report = COND #( WHEN iv_report IS NOT INITIAL
                                          THEN iv_report
                                          ELSE space ).

    rs_prof-title = COND #( WHEN iv_title IS NOT INITIAL
                              THEN iv_title
                              ELSE space ).

    IF rs_prof-grid_title-gridtitle IS INITIAL.
      rs_prof-grid_title-gridtitle = rs_prof-title.
    ENDIF.

    "Prepare settings for output of source code position
    IF iv_disp_srcpos         EQ c_true AND    "display error positions
       lines( it_srcpos ) GT 0.            "exists an error position info?
      "Enhance field catalog for ALV log display
      APPEND: VALUE #( ref_table  = c_fname_s_excep_srcpos
                       ref_field  = c_fname_class
                       col_pos    = 2
*                       coltext    = 'Class/Program'(ct1)
                       colddictxt = abap_true
                       outputlen  = 40
                       hotspot    = abap_true
                       is_extern  = abap_true ) TO rs_prof-mess_fcat,
              VALUE #( ref_table  = c_fname_s_excep_srcpos
                       ref_field  = c_fname_method
                       col_pos    = 3
*                       coltext    = 'Method/Subroutine'(ct2)
                       colddictxt = abap_true
                       outputlen  = 60
                       hotspot    = abap_true
                       is_extern  = abap_true ) TO rs_prof-mess_fcat,
              VALUE #( ref_table  = c_fname_s_excep_srcpos
                       ref_field  = c_fname_line
                       col_pos    = 4
*                       coltext    = 'Line'(ct3)
                       colddictxt = abap_true
                       outputlen  = 8
                       hotspot    = abap_true
                       is_extern  = abap_true ) TO rs_prof-mess_fcat.

      MODIFY rs_prof-mess_fcat FROM VALUE #( outputlen = '100' )
                               TRANSPORTING outputlen
                               WHERE ref_field EQ 'T_MSG' ##no_text.


      "Define callback routine to read external data to error message
      rs_prof-clbk_read = VALUE #( userexitf = c_fm_name_cb_read
                                   userexitt = 'F' ) ##no_text.  "= Funktionsbaustein
      "Source pos. cols are definied as HOTSPOT. Set call back routine here.
      rs_prof-clbk_ucom = VALUE #( userexitf = c_fm_name_cb_ucom
                                   userexitt = 'F' ) ##no_text.
    ENDIF.
  ENDMETHOD.                    "intern_get_display_profile


  METHOD intern_load.
    "-----------------------------------------------------------------*
    "   Load messages to log numbers
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_DB_LOAD'
      EXPORTING
        i_t_log_header     = it_lhdr
      IMPORTING
        e_t_log_handle     = et_logh
        e_t_msg_handle     = et_msgh
      EXCEPTIONS
        no_logs_specified  = 1
        log_not_found      = 2
        log_already_loaded = 3
        OTHERS             = 4.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                         zcx_ca_intern=>create_exception(
                                            iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                            iv_function = 'BAL_DB_LOAD' ##no_text
                                            iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.

    et_srcpos = intern_load_pos( et_msgh ).
  ENDMETHOD.                    "intern_load


  METHOD intern_load_pos.
    "-----------------------------------------------------------------*
    "   Load messages and corresponding source position
    "-----------------------------------------------------------------*
    LOOP AT it_msgh ASSIGNING FIELD-SYMBOL(<ls_msgh>).
      DATA(lv_lognr) = intern_get_lognr_from_handle( <ls_msgh>-log_handle ).

      SELECT * APPENDING TABLE rt_srcpos
               FROM zca_log_srcpos
               WHERE lognr     EQ lv_lognr
                 AND msgnumber EQ <ls_msgh>-msgnumber.
    ENDLOOP.
  ENDMETHOD.                    "intern_load_pos


  METHOD intern_msg_read.
    "-----------------------------------------------------------------*
    "   Read messages from BAL
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_LOG_MSG_READ'
      EXPORTING
        i_s_msg_handle = is_msgh
      IMPORTING
        e_s_msg        = rs_msg
      EXCEPTIONS
        log_not_found  = 1
        msg_not_found  = 2
        OTHERS         = 3.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                             iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                             iv_function = 'BAL_LOG_MSG_READ' ##no_text
                                             iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_msg_read


  METHOD intern_refresh.
    "-----------------------------------------------------------------*
    "   Remove log data from BAL
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_LOG_REFRESH'
      EXPORTING
        i_log_handle  = iv_loghndl
      EXCEPTIONS
        log_not_found = 1
        OTHERS        = 2.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                            iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                            iv_function = 'BAL_LOG_REFRESH' ##no_text
                                            iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_refresh


  METHOD intern_save.
    "-----------------------------------------------------------------*
    "   Save log on BAL DBs
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_DB_SAVE'
      EXPORTING
        i_in_update_task = CONV boolean( xsdbool( iv_in_upd_task EQ c_true ) )
        i_t_log_handle   = it_logh
      IMPORTING
        e_new_lognumbers = rt_lgnm
      EXCEPTIONS
        log_not_found    = 1
        save_not_allowed = 2
        numbering_error  = 3
        OTHERS           = 4.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                             iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                             iv_function = 'BAL_DB_SAVE' ##no_text
                                             iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_save


  METHOD intern_save_logref.
    "-----------------------------------------------------------------*
    "   Save log references in DB table providing the log number
    "-----------------------------------------------------------------*
    rv_changed = c_false.

    IF me->mt_objref IS INITIAL OR
       iv_lognr      IS INITIAL.
      RETURN.
    ENDIF.

    "Set log number into all entries
    MODIFY me->mt_objref FROM VALUE #( lognr = iv_lognr )
                         TRANSPORTING lognr
                         WHERE lognr NE iv_lognr.

    "Insert entries into DB table
    INSERT zca_log_objref FROM TABLE me->mt_objref
                          ACCEPTING DUPLICATE KEYS.
    IF lines( me->mt_objref ) LE sy-dbcnt AND
       sy-dbcnt               NE 0.
      "If all of the entries were already in DB SY-DBCNT is 0 and nothing was changed
      rv_changed = c_true.
    ENDIF.
  ENDMETHOD.                    "intern_save_logref


  METHOD intern_save_srcpos.
    "-----------------------------------------------------------------*
    "   Save source position in DB table providing the log number
    "-----------------------------------------------------------------*
    rv_changed = c_false.

    IF lines( me->mt_srcpos ) LE 0        OR
       iv_lognr               IS INITIAL.
      RETURN.
    ENDIF.

    "Set log number into all entries
    MODIFY me->mt_srcpos FROM VALUE #( lognr = iv_lognr )
                         TRANSPORTING lognr
                         WHERE lognr NE iv_lognr.

    DELETE ADJACENT DUPLICATES FROM me->mt_srcpos COMPARING lognr msgnumber.

    "Insert entries into DB table
    INSERT zca_log_srcpos FROM TABLE me->mt_srcpos
                          ACCEPTING DUPLICATE KEYS.
    IF lines( me->mt_srcpos ) LE sy-dbcnt AND
       sy-dbcnt               NE 0.
      "If all of the entries were already in DB SY-DBCNT is 0 and nothing was changed
      rv_changed = c_true.
    ENDIF.
  ENDMETHOD.                    "intern_save_srcpos


  METHOD intern_search.
    "-----------------------------------------------------------------*
    "   Search logs with filter
    "-----------------------------------------------------------------*
    CALL FUNCTION 'BAL_DB_SEARCH'
      EXPORTING
        i_s_log_filter     = is_lfil
      IMPORTING
        e_t_log_header     = rt_lhdr
      EXCEPTIONS
        log_not_found      = 1
        no_filter_criteria = 2
        OTHERS             = 3.
    IF sy-subrc NE 0.
      DATA(lx_error) = CAST zcx_ca_log(
                          zcx_ca_intern=>create_exception(
                                             iv_excp_cls = zcx_ca_log=>c_zcx_ca_log
                                             iv_function = 'BAL_DB_SEARCH' ##no_text
                                             iv_subrc    = sy-subrc ) ).
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "intern_search


  METHOD is_open.
    "-----------------------------------------------------------------*
    "   Is currently a BAL open
    "-----------------------------------------------------------------*
    IF me->ms_log IS INITIAL.
      "No current log
      RAISE EXCEPTION TYPE zcx_ca_log
        EXPORTING
          textid   = zcx_ca_log=>log_not_open
          mv_msgty = c_msgty_e.
    ENDIF.
  ENDMETHOD.                    "is_open


  METHOD save.
    "-----------------------------------------------------------------*
    "   Save messages into BAL DBs and corresponding informations
    "-----------------------------------------------------------------*
    "Is log open/created?
    me->is_open( ).

    IF iv_no_empty          EQ c_false OR "quantity of msg entries doesnt matter
       me->get_msg_count( ) GT 0.        "OR minimum 1 message exists
      "save log
      DATA(lt_lgnm) = intern_save( it_logh = VALUE #( ( me->mv_loghndl ) )
                                   iv_in_upd_task = iv_in_upd_task ).

      READ TABLE lt_lgnm ASSIGNING FIELD-SYMBOL(<ls_lgnm>) "#EC CI_SORTSEQ
                         WITH KEY log_handle = me->mv_loghndl.
      IF sy-subrc EQ 0.
        rv_lognumber = <ls_lgnm>-lognumber.
        me->intern_save_logref( rv_lognumber ). "save object refs
        me->intern_save_srcpos( rv_lognumber ). "save error positions
        IF iv_commit EQ c_true.
          COMMIT WORK AND WAIT.
        ENDIF.
      ENDIF.
    ENDIF.

    "nach dem Sichern soll das Log geschlossen werden
    IF iv_close EQ c_true.
      me->close( ).
    ENDIF.
  ENDMETHOD.                    "save


  METHOD set_ext_number.
    "-----------------------------------------------------------------*
    "   Set new external number
    "-----------------------------------------------------------------*
    me->ms_log-extnumber = iv_extnumber.

    "Provide BAL
    CALL FUNCTION 'BAL_LOG_HDR_CHANGE'
      EXPORTING
        i_log_handle            = me->mv_loghndl
        i_s_log                 = me->ms_log
      EXCEPTIONS
        log_not_found           = 1
        log_header_inconsistent = 2
        OTHERS                  = 3.
    IF sy-subrc NE 0.
      DATA(lx_error) =
            CAST zcx_ca_log(
                   zcx_ca_intern=>create_exception(
                                   iv_excp_cls    = zcx_ca_log=>c_zcx_ca_log
                                   iv_function    = 'BAL_LOG_HDR_CHANGE'
                                   iv_subrc       = sy-subrc ) )  ##no_text.
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_ext_number


  METHOD set_source_position.
    "-----------------------------------------------------------------*
    "   Set source position into buffer
    "-----------------------------------------------------------------*
    "only if information exists
    IF is_srcpos IS INITIAL.
      RETURN.
    ENDIF.

    "add to global attribute
    APPEND VALUE #( msgnumber    = is_msgh-msgnumber
                    s_exc_srcpos = is_srcpos ) TO me->mt_srcpos.
  ENDMETHOD.                    "set_source_position


  METHOD write.
    "-----------------------------------------------------------------*
    "   Print messages as list without
    "-----------------------------------------------------------------*
    LOOP AT me->get_msg_list_bapiret2( iv_msgty )
                             ASSIGNING FIELD-SYMBOL(<ls_msg>).
      WRITE / <ls_msg>-message.
    ENDLOOP.
  ENDMETHOD.                    "write

ENDCLASS.



