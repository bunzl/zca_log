*&---------------------------------------------------------------------*
*&  Include           LZCA_LOGP01
*&---------------------------------------------------------------------*

*---------------------------------------------------------------------*
*     CLASS  lcl_ucomm_handler  IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_ucomm_handler IMPLEMENTATION.

  METHOD display_errpos_in_source_code.
    "-----------------------------------------------------------------*
    "   Display error position in source code
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      ls_srcpos   TYPE zca_log_srcpos,
      ls_prg_info TYPE tpda_prg_info,
      ls_trdir    TYPE trdir,
      lv_obj_type TYPE seu_obj.

    "Determine log number to be able to find all necessary value for
    "error position display
    cl_bal_db_search=>get_header_by_key(
              EXPORTING
                i_client      = sy-mandt
                it_log_handle = VALUE #( ( is_uc_data-list_msgh-log_handle ) )
              IMPORTING
                et_log_header = DATA(lt_balhdr) ).

    READ TABLE lt_balhdr INTO  DATA(ls_balhdr)
                         INDEX 1.

    "Get source position from sorted buffer table.
    "Source position values are already determined before call of
    "display dialog and passed into this function group.
    READ TABLE gt_srcpos INTO ls_srcpos
                         WITH KEY lognr     = ls_balhdr-lognumber
                                  msgnumber = is_uc_data-list_msgh-msgnumber
                                              BINARY SEARCH.
    IF sy-subrc NE 0.
      SELECT SINGLE * INTO  ls_srcpos
                      FROM  zca_log_srcpos
                      WHERE lognr     EQ ls_balhdr-lognumber
                        AND msgnumber EQ is_uc_data-list_msgh-msgnumber.
      IF sy-subrc NE 0.
        SELECT SINGLE * INTO  ls_srcpos
                        FROM  zca_log_srcpos
                        WHERE lognr EQ ls_balhdr-lognumber. "#EC CI_NOORDER
        IF sy-subrc NE 0.
          "Insufficient data to display source position
          RAISE EXCEPTION TYPE zcx_ca_log
            EXPORTING
              textid = zcx_ca_log=>insufficient_data_for_src_pos.
        ENDIF.
      ENDIF.

      "Set source position data into buffer
      IF ls_srcpos IS NOT INITIAL.
        INSERT ls_srcpos INTO TABLE gt_srcpos.
      ENDIF.
    ENDIF.

    "Display source code - needs only the technical informations
    /iwfnd/cl_sutil_moni=>get_instance( )->show_source(
                                             iv_program    = ls_srcpos-prog
                                             iv_include    = ls_srcpos-incl
                                             iv_line       = ls_srcpos-line
                                             iv_new_window = abap_false ).
*    TRY.
*        "Is it a global class?
*        DATA(lo_cls_desc) =
*             CAST cl_abap_classdescr(
*                      zcl_ca_ddic=>get_type_desc( iv_name = ls_srcpos-class ) ).
*        "Yes -> convert method name into internal include name
*        ls_prg_info =
*             VALUE #( program = ls_srcpos-class
*                      include =
*                          cl_oo_classname_service=>get_method_include(
*                                                  VALUE #( clsname = ls_srcpos-class
*                                                           cpdname = ls_srcpos-method ) )
*                      line    = ls_srcpos-line ).
*
*      CATCH zcx_ca_param.
*        "No -> details are determined by the called report
*        ls_prg_info = VALUE #( program = ls_srcpos-class
*                               include = ls_srcpos-method
*                               line    = ls_srcpos-line ).
*        IF ls_prg_info-include IS INITIAL.
*          ls_prg_info-program = ls_srcpos-class.
*        ENDIF.
*    ENDTRY.
*
*    "Über diesen Report die Zeile mit der Ausnahme anzeigen
*    SUBMIT tpda_editor_start WITH prgm = ls_prg_info-program
*                             WITH incl = ls_prg_info-include
*                             WITH dynp = space
*                             WITH line = ls_prg_info-line
*                                  AND RETURN.
  ENDMETHOD.                    "display_errpos_in_source_code

ENDCLASS.                    " lcl_ucomm_handler  IMPLEMENTATION
