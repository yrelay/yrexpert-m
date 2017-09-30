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

;%ANGARBA^INT^1^59547,73866^0
%ANGARBA ;;02:37 PM  28 Feb 1992;
 
 
 
 
 
TOTAL N TEMP,LNVU,CRERR,NBCLEAR,NBTOT,ESTIM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TOT") K @(TEMP)
 S LNVU=$$CONCAS^%QZCHAD(TEMP,"LNVU"),@LNVU=0
 S CRERR=$$CONCAS^%QZCHAD(TEMP,"CRERR"),@CRERR=0
 D RECENSE(1,LNVU,CRERR)
 D CLEAR(LNVU,.NBCLEAR,.NBTOT)
 D BLD^%VVIDEO
 W !,NBCLEAR,"  ",$$^%QZCHW("noeuds supprimes sur")," ",NBTOT
 I DTM S ESTIM=NBCLEAR*625 I ESTIM>500000 W !,$$^%QZCHW("estimation du gain de place : "),ESTIM,"  ",$$^%QZCHW("faites une compression")
 
 D NORM^%VVIDEO H 2
 K @(TEMP)
 Q
 
 
COMPTE() N A,%A
 S A="" F %A=0:1 S A=$O(^[QUI]ANSA(A)) Q:A=""
 Q %A
 
 
 
 
 
 
 
RECENSE(VISU,LNVU,CRERR) 
 N TEMP,PILE,INTERD,BOUCLE,I,IPCOUR,OBJ,FLS,NFLS,VIS1,VIS2,VIS3,NFLS
 N R,%R,L,%L
 I VISU D CLEPAG^%VVIDEO S DX=3,DY=2 X XY W "recensement des noeuds utilises"
 S VIS1=$S(VISU:"S DX=4,DY=5 X XY W M_""                                       """,1:"")
 S VIS2=$S(VISU:"S DX=4,DY=7 X XY W R_""                                                """,1:"")
 S VIS3=$S(VISU:"S DX=4,DY=9 X XY W ""noeud ""_NFLS_""   """,1:"")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REC") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S VU=$$CONCAS^%QZCHAD(TEMP,"VU")
 D FORMAT,MODELE,REQUET,TRAIT
 K @(TEMP)
 Q
 
 
REQUET S M="Requetes" X VIS1
 S R="" F %R=0:0 S R=$O(^[QUI]RQS1(R)) Q:R=""  X VIS2 D TREQ
 Q
TREQ S L="" F %L=0:0 S L=$O(^[QUI]RQS1(R,"CONTRAINTES",L)) Q:L=""  D:$D(^[QUI]RQS1(R,"CONTRAINTES",L,"TETE")) MARK(^[QUI]RQS1(R,"CONTRAINTES",L,"TETE"))
 S L="" F %L=0:0 S L=$O(^[QUI]RQS1(R,"VARIABLES",L)) Q:L=""  D:$D(^[QUI]RQS1(R,"VARIABLES",L,"TETE")) MARK(^[QUI]RQS1(R,"VARIABLES",L,"TETE"))
 Q
 
TRAIT S M="Traitements" X VIS1
 S R="" F %R=0:0 S R=$O(^[QUI]TTL(R)) Q:R=""  X VIS2 S L="" F %L=0:0 S L=$O(^[QUI]TTL(R,2,L)) Q:L=""  D:$D(^[QUI]TTL(R,2,L,"TETE")) MARK(^[QUI]TTL(R,2,L,"TETE"))
 Q
 
FORMAT S M="Formats de documents" X VIS1
 S R="" F %R=0:0 S R=$O(^[QUI]EDFORMAT(R)) Q:R=""  X VIS2 S L="" F %L=0:0 S L=$O(^[QUI]EDFORMAT(R,"LIGNES",L)) Q:L=""  I $D(^[QUI]EDFORMAT(R,"LIGNES",L,"TETE")) D MARK(^[QUI]EDFORMAT(R,"LIGNES",L,"TETE"))
 Q
 
MODELE S M="Modeles de textes" X VIS1
 S R="" F %R=0:0 S R=$O(^[QUI]EDMOD(R)) Q:R=""  X VIS2 S L="" F %L=0:0 S L=$O(^[QUI]EDMOD(R,"LIGNE",L)) Q:L=""  I $D(^[QUI]EDMOD(R,"LIGNE",L,"TETE")) D MARK(^[QUI]EDMOD(R,"LIGNE",L,"TETE"))
 Q
 
 
 
 
MARK(A) Q:A=0
 S IPCOUR=1,NFLS=A
 S @PILE@(IPCOUR)=NFLS,@PILE@(IPCOUR,"FLS")=0,@VU@(NFLS)="",@LNVU@(NFLS)="" X VIS3
NXT S OBJ=@PILE@(IPCOUR),FLS=@PILE@(IPCOUR,"FLS")
FRE S FLS=FLS+1
 I '($D(^[QUI]ANSA(OBJ,FLS))) K @VU@(OBJ) S IPCOUR=IPCOUR-1 G:IPCOUR=0 FMARK G NXT
 S NFLS=^[QUI]ANSA(OBJ,FLS) G:NFLS=0 FRE
 I $D(@VU@(NFLS)) D MES("cycle") G FRE
 I $D(@LNVU@(NFLS)) D MES("branchement anormal") G FRE
 I '($D(^[QUI]ANSA(NFLS))) D MES("reference a un noeud manquant") G FRE
 S @PILE@(IPCOUR,"FLS")=FLS
 S IPCOUR=IPCOUR+1
 S @PILE@(IPCOUR)=NFLS,@PILE@(IPCOUR,"FLS")=0,@VU@(NFLS)="",@LNVU@(NFLS)="",@LNVU=@LNVU+1 X VIS3
 G NXT
FMARK K @(PILE),@(VU)
 Q
 
MES(MES) I VISU S DX=14,DY=9 X XY W " => ",MES H 1 X XY W "                    "
 S @CRERR=@CRERR+1,@CRERR@(@CRERR)=MES_" "_$$^%QZCHW("dans ")_M_"  "_R
 Q
 
 
 
 
CLEAR(LNVU,NBCLEAR,NBTOT) 
 N A,LST
 S (NBTOT,NBCLEAR)=0
 
 S A="" F NBTOT=0:1 S A=$O(^[QUI]ANSA(A)) Q:A=""  I '($D(@LNVU@(A))) S NBCLEAR=NBCLEAR+1 K ^[QUI]ANSA(A)
 
 S LST=$ZP(^[QUI]ANSA("")) S:LST="z" LST=$ZP(^[QUI]ANSA(LST))
 S ^[QUI]RQSGLO("ANSA")=LST+1
 Q

