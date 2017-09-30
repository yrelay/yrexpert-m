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

;%QNEQUI8^INT^1^59547,73879^0
QNEQUI8(ETUDE,LISTIND,TEMPS,INC,INCOMPG,INCOMPL,INSEPK,INSEPI,INCOMPK,CYCLE,TAL,TAG,LLISTEN,GROAFF,VT,MODE,MODAF,DMULT,MSG,GOTO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ATTS,ACUMUL,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S ACUMUL=$$CONCAS^%QZCHAD(TEMP,"ACUMUL")
 S ATTS=$$CONCAS^%QZCHAD(TEMP,"ATTS")
 S MSG=""
 G @MODE
 
S 
 D SA(ATTS,"S")
 I (INSEPK="")!('($$EX^%QSGEST7(INSEPK))) D LLISTEN^%QNEQUI3(.INSEPK,"S"),AJOUT^%QNEQETU(NOM,"LISTE.GROUPES.INSEPARABLES",INSEPK,1) K @(GROAFF)
 I $$STATUT(VT,"VERIF.INSEP.INCOMP") D CGL^%QNEQUI2 G:MSG'="" END
 I $$STATUT(VT,"INCOMP.LISTES.SORTIE.SEP") D INC^%QFGROMA(INSEPK,"S") I MSG'="" G END
 I $$STATUT(VT,"LISTES.SORTIE.PARTITION.SEP") D PART^%QFGROMA(INSEPK,"S") I MSG'="" G END
 I $$STATUT(VT,"LISTES.SORTIE.OK.SEP") D VERIL^%QFGROMA(INSEPK,"S") I MSG'="" G END
 I $$STATUT(VT,"SORTIE.CUMULS.SEP") D CUM^%QFGROMA(INSEPK,"S")
 I $$STATUT(VT,"SORTIE.AFFECTATIONS.SEP") D AFFEC^%QFGROMA(VT,LISTIND,INSEPK,"S",GROAFF)
 S MSG=$$^%QFGROMA(LISTIND,INSEPK,"",ATTS,ACUMUL,GROAFF,VT,"S",.GOTO)
 D STATSET(VT,"VERIF.INSEP.INCOMP",0)
 D STATSET(VT,"INCOMP.LISTES.SORTIE",0)
 D STATSET(VT,"INCOMP.LISTES.SORTIE.SEP",0)
 G END
 
C 
 D SA("","C")
 I (INCOMPK="")!('($$EX^%QSGEST7(INCOMPK))) D LLISTEN^%QNEQUI3(.INCOMPK,"C"),AJOUT^%QNEQETU(NOM,"LISTE.GROUPES.INCOMPATIBLES",INCOMPK,1) K @(GROAFF)
 I $$STATUT(VT,"VERIF.INSEP.INCOMP") D CGL^%QNEQUI2 G:MSG'="" END
 I $$STATUT(VT,"LISTES.SORTIE.OK.COMP") D VERIL^%QFGROMA(INCOMPK,"C") I MSG'="" G END
 I $$STATUT(VT,"SORTIE.AFFECTATIONS.COM") D AFFEC^%QFGROMA(VT,LISTIND,INCOMPK,"C",GROAFF)
 I $$STATUT(VT,"SORTIE.AFFECTATIONS") D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,"E",@VT@("GRO"))
 S MSG=$$^%QFGROMA(LISTIND,INCOMPK,"","",ACUMUL,GROAFF,VT,"C",.GOTO)
 D STATSET(VT,"VERIF.INSEP.INCOMP",0)
 D STATSET(VT,"INCOMP.LISTES.SORTIE",0)
 G END
 
E 
 D REINIT^%QNEQUY
 D SA(ATTS,"E")
 I $$STATUT(VT,"CREATION.LISTES.TEMPO") D CRELIS^%QNEQUI3
 I $$STATUT(VT,"MAJ.INDICATEURS") D MAJ^%QNEQU11
 I (LLISTEN="")!('($$EX^%QSGEST7(LLISTEN))) D LLISTEN^%QNEQUI3(.LLISTEN,"E"),AJOUTL^%QNEQETU(NOM,LLISTEN) K @(GROAFF)
 I $$STATUT(VT,"VERIF.INSEP.INCOMP") D CGL^%QNEQUI2 G:MSG'="" END
 I $$STATUT(VT,"INCOMP.LISTES.SORTIE") D INC^%QFGROMA(LLISTEN,"E") I MSG'="" G END
 I $$STATUT(VT,"LISTES.SORTIE.PARTITION") D PART^%QFGROMA(LLISTEN,"E") I MSG'="" G END
 I $$STATUT(VT,"LISTES.SORTIE.OK") D VERIL^%QFGROMA(LLISTEN,"E") I MSG'="" G END
 I $$STATUT(VT,"SORTIE.CUMULS") D CUM^%QFGROMA(LLISTEN,"E")
 I $$STATUT(VT,"SORTIE.AFFECTATIONS") D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,"E",GROAFF)
 S MSG=$$^%QFGROMA(LISTIND,LLISTEN,"",ATTS,ACUMUL,GROAFF,VT,"E",.GOTO)
 G FIN
 
G 
 D SA(ATTS,"G")
 I (LLISTEN="")!('($$EX^%QSGEST7(LLISTEN))) D LLISTEN^%QNEQUI3(.LLISTEN,"E"),AJOUTL^%QNEQETU(NOM,LLISTEN) K @(GROAFF)
 I $$STATUT(VT,"LISTES.SORTIE.PARTITION") D PART^%QFGROMA(LLISTEN,"G") I MSG'="" G END
 I $$STATUT(VT,"LISTES.SORTIE.OK") D VERIL^%QFGROMA(LLISTEN,"G") I MSG'="" G END
 I $$STATUT(VT,"SORTIE.AFFECTATIONS") D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,"G",GROAFF)
 S MSG=$$^%QFGROMA(LISTIND,LLISTEN,"",ATTS,ACUMUL,GROAFF,VT,"G",.GOTO)
 G FIN
 
L 
 D SA(ATTS,"L")
 I (LLISTEN="")!('($$EX^%QSGEST7(LLISTEN))) D LLISTEN^%QNEQUI3(.LLISTEN,"E"),AJOUTL^%QNEQETU(NOM,LLISTEN) K @(GROAFF)
 I $$STATUT(VT,"LISTES.SORTIE.OK") D VERIL^%QFGROMA(LLISTEN,"L") I MSG'="" G END
 I $$STATUT(VT,"SORTIE.AFFECTATIONS") D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,"L",GROAFF)
 S MSG=$$^%QFGROMA(LISTIND,LLISTEN,"",ATTS,ACUMUL,GROAFF,VT,"L",.GOTO)
 G FIN
 
FIN 
 D AJTYP^%QNEQUI3(ETUDE,"ASSISTE"),MAJ^%QNEQUI3(ETUDE)
END K @(TEMP)
 Q
 
 
STATUT(VT,INI) 
 N AD S AD=$$CONCAS^%QZCHAD(VT,"INIT")
 Q '($S($D(@AD@(INI)):@AD@(INI),1:0))
STATSET(VT,INI,VAL) 
 N AD S AD=$$CONCAS^%QZCHAD(VT,"INIT")
 S @AD@(INI)=VAL
 Q
 
SA(ATTS,UTIL) 
 N ATT,I
 D ^%VZEATT
 G:ATTS="" ISA
 S @ATTS@(TEMPS,"CUMUL")=1,@ATTS@(TEMPS,"ORDRE")=1
 S ATT="" F I=0:0 S ATT=$O(@ATTS@(ATT)) Q:ATT=""  I ($D(@ATTS@(ATT,"CUMUL"))#10)=1,@ATTS@(ATT,"CUMUL")=1 S @ACUMUL@(ATT)=1
ISA S I=$$REP^%QNEQETU
 S @VT@("EQUIR")=$$^%QSCALIN(I,ETUDE,"EQUILIBRE.REEL",TEMPS)
 S @VT@("TAUX")=$$^%QSCALIN(I,ETUDE,"TAUX.OPERATIONS.AFFECTEES",TEMPS)
 S @VT@("CYCLER")=$$^%QSCALIN(I,ETUDE,"CYCLE.REEL",TEMPS)
 F I="INCOMPL","TEMPS","INC","INCOMPG","INSEPI","INCOMPK","CYCLE","TAL","TAG","LLISTEN","MODAF","DMULT" S @VT@(I)=@I
 
 S @VT@("TITRE")=$$^%QZCHW($S(UTIL="E":"Equilibrage",UTIL="S":"Inseparables de",UTIL="C":"Incompatibles de",UTIL="G":"Groupage",1:"Groupage libre"))_" "_ETUDE
 S I=@VT@("DATE.UTILISATION") I I'="" S @VT@("TITRE")=@VT@("TITRE")_" du "_I
 Q:UTIL'="E"
 S I=@VT@("TYPE.EQUILIBRAGE"),@VT@("TITRE")=@VT@("TITRE")_"  ("_I_" sous cycle = "_CYCLE_")"
 Q

