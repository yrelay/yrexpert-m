;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QFGROMA^INT^1^59547,73875^0
QFGROMA(LISTIND,LLISTEN,TRI,ATTS,ACUMUL,GROAFF,VT,UTIL,GOTO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,MSG,FGR,FIND,FZOOM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S FGR=$$CONCAS^%QZCHAD(TEMP,"FGR")
 S FIND=$$CONCAS^%QZCHAD(TEMP,"FIND")
 S FZOOM=$$CONCAS^%QZCHAD(TEMP,"FZOOM")
 S MSG=""
 D CFEN(@VT@("ETUDE"),ATTS,LLISTEN,FGR,LISTIND,FIND,FZOOM,ACUMUL,UTIL,.MSG)
 I MSG'="" G FIN
 
 D ^%QFGRDEC(LISTIND,LLISTEN,FGR,FIND,FZOOM,ACUMUL,GROAFF,VT,UTIL,.GOTO)
FIN 
 K @(TEMP)
 Q MSG
 
 
 
CFEN(ETUDE,ATTS,LLISTEN,FGR,LISTIND,FIND,FZOOM,ACUMUL,UTIL,MSG) 
 D ATTC(ETUDE,ATTS,FGR,FIND,FZOOM,ACUMUL,UTIL)
 D AGROUP^%QFGRECR(LLISTEN,FGR,.MSG) I MSG'="" Q
 D ALIND^%QFGRECR(LISTIND,FIND,.MSG)
 Q
ATTC(ETUDE,ATTS,FGR,FIND,FZOOM,ACUMUL,UTIL) 
 
 
 N ATT,I,ORDRE,LAG,LAI
 
 
 S @FGR@("SYN")=1,@FGR@("SYN.A")="DESIGNATION"
 
 S @FIND@("SYN")=1,@FIND@("SYN.A")="NOM"
 S @FZOOM@("SYN")=1,@FZOOM@("SYN.A")="NOM"
 
 S @FGR@("C",1,"T")=$$^%QZCHW("cardinal")
 S @FGR@("C",1,"C")="CARD"
 S @FGR@("C",1,"L")=6
 S @FIND@("C",1,"T")=$$^%QZCHW("affectation")
 S @FIND@("C",1,"L")=15
 S @FIND@("C",1,"C")=$$ATAF^%QFGRACT(UTIL)
 S @FIND@("C",1,"FCT")="$$SYN^%QFGRECR"
 I ATTS'="" S ATT="" F I=0:0 S ATT=$O(@ATTS@(ATT)) Q:ATT=""  D ATTC1
 G:(UTIL="S")!(UTIL="C") FCUST
 G:UTIL'="E" GR
 
 S I=$ZP(@FIND@("C",""))+1
 S @FIND@("C",I,"T")=$$^%QZCHW("insep")
 S @FIND@("C",I,"C")=$$SEP^%QFGRACT
 S @FIND@("C",I,"L")=6
 S @FIND@("C",I,"FCT")="$$INSEP^%QFGRECR"
 S I=I+1
 S @FIND@("C",I,"T")=$$^%QZCHW("incom")
 S @FIND@("C",I,"C")="AFFECTATION.INCOMPATIBLE"
 S @FIND@("C",I,"L")=6
 S @FIND@("C",I,"FCT")="$$INCOMP^%QFGRECR"
GR S I=$ZP(@FGR@("C",""))+1
 S @FGR@("C",I,"T")=$$^%QZCHW("concession")
 S @FGR@("C",I,"C")="CONCESSION"
 S @FGR@("C",I,"L")=6
 S I=I+1
 S @FGR@("C",I,"T")=$$^%QZCHW("effectif.poste")
 S @FGR@("C",I,"C")="EFFECTIF.POSTE"
 S @FGR@("C",I,"L")=6
 
FCUST 
 D AJ(FGR,$$^%QSCALVA($$REP^%QNEQETU,ETUDE,"LISTE.ATTRIBUTS.GROUPES"))
 D AJ(FIND,$$^%QSCALVA($$REP^%QNEQETU,ETUDE,"LISTE.ATTRIBUTS.INDIVIDUS"))
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(FIND,"C"),$$CONCAS^%QZCHAD(FZOOM,"C"))
 Q
 
ATTC1 
 S ORDRE=@ATTS@(ATT,"ORDRE")
 S @FGR@("C",ORDRE+1,"T")=ATT
 S @FGR@("C",ORDRE+1,"C")=ATT
 S @FGR@("C",ORDRE+1,"L")=15
 S @FIND@("C",ORDRE+1,"T")=ATT
 S @FIND@("C",ORDRE+1,"C")=ATT
 S @FIND@("C",ORDRE+1,"L")=15
 Q
 
AJ(TEMP,LISTA) 
 Q:LISTA=""
 N %I,ATR,I,GL
 S GL=$$LIST^%QMLILA(LISTA) Q:GL=""
 S I=$ZP(@TEMP@("C",""))+1,ATR=""
 F %I=0:0 S ATR=$O(@GL@(ATR)) Q:ATR=""  S @TEMP@("C",I,"C")=@GL@(ATR),@TEMP@("C",I,"T")=$$TITRE^%QMLILA(LISTA,ATR),@TEMP@("C",I,"L")=$$LONG^%QMLILA(LISTA,ATR),@TEMP@("C",I,"I")=$$INDICE^%QMLILA(LISTA,ATR),I=I+1
 Q
 
 
PART(LLISTEN,UTIL) 
 N OO
 S OO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OO") K @(OO)
 
 D PART^%QFGRVER(LISTIND,LLISTEN,OO,.MSG)
 I MSG'="" D AFF(OO) K @(OO) Q
 D STATSET^%QNEQUI8(VT,$$INI("LISTES.SORTIE.PARTITION",UTIL),1)
 Q
 
VERIL(LLISTEN,UTIL) 
 N OO
 S OO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OO") K @(OO)
 D ^%QFGRVER(LISTIND,LLISTEN,OO,.MSG)
 I MSG'="" D AFF(OO) K @(OO) Q
 D STATSET^%QNEQUI8(VT,$$INI("LISTES.SORTIE.OK",UTIL),1)
 Q
 
CUM(LLISTEN,UTIL) 
 D MSG^%VZEATT($$^%QZCHW("initialisation des cumuls"))
 D INIT^%QFGREVA(LISTIND,LLISTEN,ACUMUL)
 D STATSET^%QNEQUI8(VT,$$INI("SORTIE.CUMULS",UTIL),1)
 Q
 
AFFEC(VT,LISTIND,LLISTEN,UTIL,GROAFF) 
 
 
 D MSG^%VZEATT($$^%QZCHW("initialisation des affectations"))
 D AFFEC^%QFGREVA(LISTIND,LLISTEN,$$ATAF^%QFGRACT(UTIL),GROAFF)
 D STATSET^%QNEQUI8(VT,$$INI("SORTIE.AFFECTATIONS",UTIL),1)
 
 S PRECEDE=0,NOMLIEN=$$^%QSCALIN("ETUDE.I",@VT@("ETUDE"),"RELATION.PRECEDENCE",1)
 Q:NOMLIEN=""
 S REP=$$^%QSCALIN("L0",LISTIND,"BASE",1)
 D ADR^%QEPRIM(REP,NOMLIEN)
 D INIT^%QEPRIM(REP,NOMLIEN)
 D COUNT^%QEPRIM(REP,NOMLIEN)
 S PRECEDE=1
 Q
 
INC(LLISTEN,UTIL) 
 K @(INCOMPL)
 D PLUSINC^%QNEQUI9(LLISTEN,INSEPI,INC,INCOMPG,INCOMPL,.MSG)
 D STATSET^%QNEQUI8(VT,$$INI("INCOMP.LISTES.SORTIE",UTIL),1)
 D STATSET^%QNEQUI8(VT,$$INI("INCOMP.LISTES.SORTIE",$S(UTIL="S":"E",1:"S")),0)
 Q
 
INI(INI,UTIL) 
 
 Q:UTIL="S" INI_".SEP"
 Q:UTIL="C" INI_".COMP"
 Q INI
 
AFF(IMP) 
 N DEB
 S DEB=1
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("erreurs"),0),CARSA^%VVIDEO(0,1,79,21)
 D REAFF^%QULIMO3(1,1,IMP,0,1,79,21)
 D VISU^%QULIMO(0,1,79,21,IMP,.DEB)
 Q

