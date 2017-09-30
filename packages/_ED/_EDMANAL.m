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

;%EDMANAL^INT^1^59547,73869^0
EDMANAL(MDL,TRACE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PBME,TET,MOD,L,LP,LPP,OK,SX,SY,X1,ROUTREAF
 D SIGNAL^%EDDGEST(MDL)
 S OK=1,PBME=0,DEJAERR=0
 K ^DOC($J) S ROUTREAF=""
 S LP=$$^%QCAZG("^[QUI]PBMANA(""MODELE"")")+1
 
 D LEX^%AN7
 F I="%COEFFICIENT.AGRANDISSEMENT","%X","%Y","%TAILLE","%ORIENTATION","%EPAISSEUR","%POLICE","%FORMAT" D ADD^%AN7(I)
 
 W:TRACE !,$$^%QZCHW("Individus symboliques")_" : "
 W:TRACE !,"-----------------------",!
 S SX=0,SY=0,(DX,DY)=0
 F L=1:1:$ZP(^[QUI]EDMOD(MDL,"VAR","")) S Y1=^[QUI]EDMOD(MDL,"VAR",L) W !,Y1 D AJVAR^%EDSYMAN I '(OK) D ERRSYM S (PBME,OK)=1
 
 
 K ^[QUI]EDMOD(MDL,"COMP")
 W:TRACE !,$$^%QZCHW("Instructions du modele")_" : "
 W:TRACE !,"------------------------",!
 S X1=1
 F L=1:1:$ZP(^[QUI]EDMOD(MDL,"LIGNE","")) D TL I '(OK) D ERREUR S (PBME,OK)=1
 
 D MAJ^%EDDGEST(MDL,0,1,1-PBME)
 
 
 S MOD=MDL
 K ^[QUI]EDMOD(MOD,"%"),^[QUI]EDMOD(MOD,"ATT")
 D VARCOMP^%EDGETMD
 S ^[QUI]PBMANA("MODELE")=LP-1
 Q '(PBME)
 
 
TL N %COMPIL,%ETIQ,POSIT,SX,SY,%PROVEN,APPD,ATTD,APPEX,%IC
 S %PROVEN="EDMOD"
 S (SX,SY)=0,POSIT=1,(%ETIQ,%COMPIL)="",(APPD,ATTD,APPEX)=0
 W:TRACE !,$$^%QZCHW("Debut analyse ligne no")," : ",L
 I TRACE&((L#8)=1) S DX=(79-$L(MDL))-3,DY=$S($Y>20:23,1:$Y) X XY D REV^%VVIDEO W MDL D NORM^%VVIDEO
 W:TRACE !,?5,^[QUI]EDMOD(MDL,"LIGNE",L)
 
 S TET=$$^%QCAZG("^[QUI]EDMOD(MDL,""LIGNE"",L,""TETE"")")
 K ^[QUI]EDMOD(MDL,"LIGNE",L,"TETE")
 I $D(^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.ATTRIBUTS")) S ATTD=^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.ATTRIBUTS"),^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.ATTRIBUTS")=0 F I=1:1:ATTD K ^[QUI]EDMOD(MDL,"LIGNE",L,"ATTRIBUT."_I)
 I $D(^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.APPELS")) S APPD=^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.APPELS"),^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.APPELS")=0 F I=1:1:APPD K ^[QUI]EDMOD(MDL,"LIGNE",L,"APPEL."_I)
 S (ATTD,APPD,APPEX)=0
 D KILL^%ANA(TET),INIT2^%AN7(SX,SY)
 
 S OK=$$MODELE^%AN9(^[QUI]EDMOD(MDL,"LIGNE",L))
 W:TRACE !,$$^%QZCHW("analyse")," ",$S(OK:"",1:$$^%QZCHW("N")),$$^%QZCHW("OK")
 I '(OK) S ^[QUI]EDMOD(MDL,"COMP",L)=";" Q
 
 
 S:%ETIQ'="" ^[QUI]EDMOD(MDL,"ETI",%ETIQ)=L
 S ^[QUI]EDMOD(MDL,"COMP",L)=%COMPIL
 S ^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.ATTRIBUTS")=ATTD
 S ^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.APPELS")=APPD
 S ^[QUI]EDMOD(MDL,"LIGNE",L,"NBR.APPELS.CALCULES")=APPEX
 N %c,ATTDI F I=1:1:ATTD S %c=$$LEX^%LXSTOCK(ATTD(I),.ATTDI) S:%c=0 ATTDI=ATTD(I) S:%c>1 ATTDI="ERREUR.LEXIQUE("_ATTD(I)_")" S ^[QUI]EDMOD(MDL,"LIGNE",L,"ATTRIBUT."_I)=ATTDI
 F I=1:1:APPD S ^[QUI]EDMOD(MDL,"LIGNE",L,"APPEL."_I)=APPD(I)
 D END^%AN7 Q
 
REAFF 
 W:TRACE !,?5,^[QUI]EDMOD(MDL,"LIGNE",L)
 Q
 
REANA(MDL,LIGNE) 
 S TRACE=0,L=LIGNE G TL
 
 
ERRSYM G:PBME ERREURS
 S ^[QUI]PBMANA("MODELE",LP)=MDL,LP=LP+1
 S ^[QUI]PBMANA("MODELE",LP)=$TR($J(" ",$L(MDL))," ","-"),LP=LP+1
ERRSYMS S ^[QUI]PBMANA("MODELE",LP)="     "_$$^%QZCHW("Probleme sur l'individu symbolique")_" "_Y1,LP=LP+1
 Q
ERREUR G:PBME ERREURS
 S ^[QUI]PBMANA("MODELE",LP)=MDL,LP=LP+1
 S ^[QUI]PBMANA("MODELE",LP)=$TR($J(" ",$L(MDL))," ","-"),LP=LP+1
ERREURS S ^[QUI]PBMANA("MODELE",LP)="     "_$$^%QZCHW("Probleme sur la ligne no")_" "_L_" : "_^[QUI]EDMOD(MDL,"LIGNE",L),LP=LP+1
 Q

