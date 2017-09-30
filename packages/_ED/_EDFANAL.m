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

;%EDFANAL^INT^1^59547,73869^0
%EDFANAL(FRM,TRACE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 K ^[QUI]EDFORMAT(FRM,"COMP")
 N LP,LPP,PBM,ROUTREAF,TET,X1,L,OK
 S X1=1,OK=1,PBME=0,ROUTREAF=""
 S LP=$$^%QCAZG("^[QUI]PBMANA(""FORMAT"")")+1
 F L=1:1:$ZP(^[QUI]EDFORMAT(FRM,"LIGNES","")) D TL D:'(OK) PBME
 
 D MAJ^%EDFGEST(FRM,0,1,1-PBME)
 
 S FORMAT=FRM K ^[QUI]EDFORMAT(FRM,"%") D VARCOMP^%EDFDIAL
 S ^[QUI]PBMANA("FORMAT")=LP-1
 Q '(PBME)
 
PBME 
 G:PBME PBMES
 S PBME=1
 S ^[QUI]PBMANA("FORMAT")=FRM,LP=LP+1
 S ^[QUI]PBMANA("FORMAT",LP)=$TR($J(" ",$L(FRM))," ","-"),LP=LP+1
PBMES S ^[QUI]PBMANA("FORMAT",LP)="     "_$$^%QZCHW("Probleme sur la ligne no")_" "_L_" : "_^[QUI]EDFORMAT(FRM,"LIGNES",L),LP=LP+1
 S OK=1
 Q
 
TL N %COMPIL,ARBRE,POSIT,SX,SY,%PROVEN,ATTD,APPD,APPEX
 S (SX,SY)=0,POSIT=1,%COMPIL=""
 S %PROVEN="EDFORMAT"
 W:TRACE !,$$^%QZCHW("Debut analyse ligne no")_" : ",L
 I TRACE&((L#8)=1) S DX=(79-$L(FRM))-3,DY=$S($Y>2:23,1:1) X XY D REV^%VVIDEO W FRM D NORM^%VVIDEO
 W:TRACE !,?5,^[QUI]EDFORMAT(FRM,"LIGNES",L)
 
 S TET=$$^%QCAZG("^[QUI]EDFORMAT(FRM,""LIGNES"",L,""TETE"")")
 K ^[QUI]EDFORMAT(FRM,"LIGNES",L,"TETE")
 I $D(^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.ATTRIBUTS")) S ATTD=^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.ATTRIBUTS"),^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.ATTRIBUTS")=0 F I=1:1:ATTD K ^[QUI]EDFORMAT(FRM,"LIGNES",L,"ATTRIBUT."_I)
 I $D(^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.APPELS")) S APPD=^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.APPELS"),^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.APPELS")=0 F I=1:1:APPD K ^[QUI]EDFORMAT(FRM,"LIGNES",L,"APPEL."_I)
 S (ATTD,APPD,APPEX)=0
 D KILL^%ANA(TET),INIT2^%AN7(SX,SY)
 
 S OK=$$GRAPH^%AN8(^[QUI]EDFORMAT(FRM,"LIGNES",L),.POSIT)
 W:TRACE&('(OK)) !,?5,$J("",POSIT-1),"^"
 W:TRACE !,$$^%QZCHW("analyse")," ",$S(OK:"",1:$$^%QZCHW("N")),$$^%QZCHW("OK")
 I '(OK) S ^[QUI]EDFORMAT(FRM,"COMP",L)=";" Q
XXX 
 S ^[QUI]EDFORMAT(FRM,"COMP",L)=%COMPIL
 S ^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.ATTRIBUTS")=ATTD
 S ^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.APPELS")=APPD
 S ^[QUI]EDFORMAT(FRM,"LIGNES",L,"NBR.APPELS.CALCULES")=APPEX
 N %c,ATTDI F I=1:1:ATTD S %c=$$LEX^%LXSTOCK(ATTD(I),.ATTDI) S:%c=0 ATTDI=ATTD(I) S:%c>1 ATTDI="ERREUR.LEXIQUE("_ATTD(I)_")" S ^[QUI]EDFORMAT(FRM,"LIGNES",L,"ATTRIBUT."_I)=ATTDI
 F I=1:1:APPD S ^[QUI]EDFORMAT(FRM,"LIGNES",L,"APPEL."_I)=APPD(I)
 D END^%AN7 Q
 
REANA(FRM,LIGNE) 
 S TRACE=0,L=LIGNE G TL

