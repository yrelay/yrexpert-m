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

;%SDOSYM2^INT^1^59547,73889^0
SDOSYM2 ;
 
 
 
 
 
 
 
 
DEPL 
 S EL="" F %EL=0:0 S EL=$O(@POINT@(EL)) Q:EL=""  D MAJPT(EL)
 D GRAPH^%SDEDEF
 I %TERM'="VT-340" D ^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q
MAJPT(EL) 
 N NOELPT,PRES
 S PRES=@GLOBJ@("EL",EL,"PRES")
 S NOELPT=$$NOPTEL^%SDEGEST(OBJ,VERS,EL)
 S @GLOBJ@("PTR",NOELPT,"X")=$P(PRES,"^",2)
 S @GLOBJ@("PTR",NOELPT,"Y")=$P(PRES,"^",3)
 Q
RECOP 
 
 N NOPTEL,DEB,EL
 S NOPTEL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOPTEL") K @(NOPTEL)
 S DEB=$ZP(@GLOBJ@("EL",""))
 
 S EL="" F %EL=0:0 S EL=$O(@POINT@(EL)) Q:EL=""  D CREAPT(EL)
 
 S EL="" F %EL=0:0 S EL=$O(@NEW@(EL)) Q:EL=""  D CREAEL(EL)
 I %TERM'="VT-340" D GRAPH^%SDEDEF,REAF2^%SDOAFFI(OBJ,VERS,%PORT,%TERM,DEB)
 I %TERM="VT-340" D GRAPH^%SDEDEF,CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 D AXE^%SDOSYM(XD,YD,ANGLE,1)
 D EFF^%PBP5EC(0)
 Q
 
 
 
 
CREAPT(ANCEL) 
 W "*"
 N NOVEL,SYNT,TEXTE,PRES,NOMPT,NEWPT
 S NOVEL=@POINT@(ANCEL)
 S TYPE=@GLOBJ@("EL",ANCEL,"TYPE"),SYNT=@GLOBJ@("EL",ANCEL,"SYNT"),TEXTE=@GLTEXT@(ANCEL)
 S PRES=@NEW@(NOVEL,"PRES")
 
 S NOMPT=$P(@GLOBJ@("EL",EL,"PRES"),"^",4),NOMPT=$P(NOMPT,"P",2)
 
 S NEWPT=$ZP(@GLOBJ@("PT","z"))+1
 S $P(PRES,"^",4)="P"_NEWPT
 
 S $P(TEXTE," ; ",3)="P"_NEWPT
 S $P(TEXTE," ; ",1)=NOVEL
 
 S @GLTEXT@(NOVEL)=TEXTE
 S @GLOBJ@("EL",NOVEL,"TYPE")="POINT"
 S @GLOBJ@("EL",NOVEL,"PRES")=PRES
 S @GLOBJ@("PT",NEWPT)=""
 S @GLOBJ@("PT",NEWPT,"NOEL")=NOVEL
 S @GLOBJ@("PT",NEWPT,"X")=""
 S @GLOBJ@("PT",NEWPT,"Y")=""
 S @GLOBJ@("PTR",NEWPT,"X")=$P(PRES,"^",2)
 S @GLOBJ@("PTR",NEWPT,"Y")=$P(PRES,"^",3)
 S @GLOBJ@("PAE",NEWPT,NOVEL)=""
 S @GLOBJ@("PAEI",NOVEL,NEWPT)=""
 D ELEM(NOVEL,ANCEL,PRES)
 S @GLOBJ@("PTR",NEWPT,"X")=$P(PRES,"^",2)
 S @GLOBJ@("PTR",NEWPT,"Y")=$P(PRES,"^",3)
 S @GLOBJ@("PT",NEWPT,"NOEL")=NOVEL
 S @NOPTEL@(NOVEL)=NEWPT
 Q
 
CREAEL(NOVEL) 
 W "+"
 N ANCEL,SYNT,TEXTE,PRES,NOMPT,NEWPT,NOELPT,NEWEL
 S ANCEL=@NEW@(NOVEL,"EL")
 S TYPE=@GLOBJ@("EL",ANCEL,"TYPE"),SYNT=@GLOBJ@("EL",ANCEL,"SYNT"),TEXTE=@GLTEXT@(ANCEL)
 Q:TYPE="POINT"
 S PRES=@NEW@(NOVEL,"PRES")
 
 I $D(@GLOBJ@("PAEI",ANCEL)) G POINT
 I TYPE=$$^%QZCHW("RACCORDEMENT") G POINT
 G ANAEL
 
POINT 
 N CH1,CH2,PT,NELPT
 S PT="",CPT=0
COP11 
 S PT=$O(@GLOBJ@("PAEI",ANCEL,PT))
 G:PT="" COP12
 S NEL=@POINT@($$NOELPT^%SDEGEST(OBJ,VERS,PT))
 S NELPT=@NOPTEL@(NEL)
 
 S CH1="P"_PT,CH2="P"_NELPT
 S TEXTE=$$ZSUBST^%QZCHSUB(TEXTE,CH1,CH2)
 G COP11
 
COP12 
 I TYPE'=$$^%QZCHW("RACCORDEMENT") G ANAEL
 
RACCO 
 
 N D1,D2
 S D1=$P(PRES,"^",2),D2=$P(PRES,"^",5)
 
 S $P(PRES,"^",2)=@DROITE@(D1),$P(PRES,"^",5)=@DROITE@(D2)
 
 
 S D1=$P(TEXTE," ; ",5)
 S $P(TEXTE," ; ",5)=@DROITE@(D1)
 
 S D2=$P(TEXTE," ; ",7)
 S $P(TEXTE," ; ",7)=@DROITE@(D2)
 
 S PT=$P(TEXTE," ; ",6),PT=$P(PT,"P",2)
 S NEL=@POINT@($$NOELPT^%SDEGEST(OBJ,VERS,PT))
 S NELPT=@NOPTEL@(NEL)
 S $P(TEXTE," ; ",6)="P"_NELPT
 
 S PT=$P(TEXTE," ; ",8),PT=$P(PT,"P",2)
 S NEL=@POINT@($$NOELPT^%SDEGEST(OBJ,VERS,PT))
 S NELPT=@NOPTEL@(NEL)
 S $P(TEXTE," ; ",8)="P"_NELPT
ANAEL 
 S @GLOBJ@("EL",NOVEL,"TYPE")=TYPE
 S $P(TEXTE," ; ",1)=NOVEL
 S @GLTEXT@(NOVEL)=TEXTE
 D ELEM(NOVEL,ANCEL,PRES)
 Q
 
 
ELEM(NEWEL,ANCEL,PRES) 
 N RES,NOM,MERR,ANCNOM S ANCNOM=""
 
 S COND=$$CONDI^%SDEGES3(ANCEL),ANCEL=""
 
 S OK=$$LIGNE^%SDEANT1(@GLTEXT@(NEWEL),0,0,NEWEL,0,1,.NOM,.RES,.MERR)
 S @GLOBJ@("EL",NEWEL,"PRES")=PRES
 
 I COND="" Q
 
 S OK=$$COND^%SDEANTI(NEWEL,COND,35,23,0,.MERR)
 Q
 ;

