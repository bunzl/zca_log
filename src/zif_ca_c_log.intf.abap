"! <p class="shorttext synchronized" lang="en">Common object: Constants for application log</p>
INTERFACE zif_ca_c_log PUBLIC.
*   c o n s t a n t s
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Application Log: Object ZCA</p>
    c_object_zca           TYPE balobj_d          VALUE 'ZCA' ##no_text,
*   Object category Ids for key LPOR
    "! <p class="shorttext synchronized" lang="en">Object category: Class</p>
    c_catid_cl         TYPE sibfcatid         VALUE swfco_objtype_cl,
    "! <p class="shorttext synchronized" lang="en">Object category: Business object (SWO1/old)</p>
    c_catid_bo         TYPE sibfcatid         VALUE swfco_objtype_bor,
*   Problem classes
    "! <p class="shorttext synchronized" lang="en">Problem class: Undefined</p>
    c_probclass_undef  TYPE balprobcl         VALUE space,
    "! <p class="shorttext synchronized" lang="en">Problem class: Very important</p>
    c_probclass_vimp   TYPE balprobcl         VALUE '1',
    "! <p class="shorttext synchronized" lang="en">Problem class: Important</p>
    c_probclass_imp    TYPE balprobcl         VALUE '2',
    "! <p class="shorttext synchronized" lang="en">Problem class: Default</p>
    c_probclass_def    TYPE balprobcl         VALUE '3',
    "! <p class="shorttext synchronized" lang="en">Problem class: Information</p>
    c_probclass_info   TYPE balprobcl         VALUE '4',
*   Operating mode
    "! <p class="shorttext synchronized" lang="en">Operating mode: Batch processing</p>
    c_mode_batch       TYPE balmode           VALUE 'B',
    "! <p class="shorttext synchronized" lang="en">Operating mode: Dialog processing</p>
    c_mode_dialog      TYPE balmode           VALUE 'D',
    "! <p class="shorttext synchronized" lang="en">Operating mode: Batch input processing</p>
    c_mode_batch_input TYPE balmode           VALUE 'I'.
ENDINTERFACE.
