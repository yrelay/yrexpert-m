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

;%QSACTI2^INT^1^59547,73880^0
%QSACTI2 ;
 
 
 
 
 
 
 
 
 
 
 
CRIT 
 N NA,VARI,ATTR,IND,CCA,A,B,CA,CTX,FC,I,IN,%IN,J,LLIST,POSS,OKECR
 K VARI,ATTR,IND
 S OKECR=$$GET^%SGVAR("ECR")
 S CCA=0
 F I=1:1:$ZP(C("")) S CCA=CCA+C(I,1),LLIST(I,"CARD")=C(I,1),LLIST(I,"ADRESSE")=C(I,2)
 S (AD,^CXZ($J))=^CXZ($J)+1
 S CA=$$INT^%QS0CALC("LLIST","^CXZ($J,"_AD_")")
 S (B,^CXZ($J))=^CXZ($J)+1
 S A=$$RED^%ANA(AR,"MODELE")
 S NA=1 F I=1:1 S C=$P(A,";",I) Q:C=""  S VARI(I)=$P(C,",",1),ATTR(I)=$P(C,",",2),IND(I)=$P(C,",",3),NA=NA+1
 S FC=0,CA=0,IN="" F %IN=0:0 S IN=$O(^CXZ($J,AD,IN)) Q:IN=""  S FC=FC+1 D:OKECR AFFPT(FC) D VALID(1)
 
 S AD="^CXZ($J,"_B_")",CD=CA,^CXZ($J,B)=CA
 Q
VALID(NII) 
 S FC=FC+1
 G:NII'=NA VALSUIT
 S J=$$^%QSACTVL($$RED^%ANA(AR,"ARBRE"),"CTX")
 I J'="" I @(J)  S CA=CA+1,^CXZ($J,B,IN)=""
 Q
VALSUIT N %VAL
 S %VAL="" F %VA=0:0 S %VAL=$O(@C(IND(NII),2)@(IN,%VAL)) Q:%VAL=""  S CTX(VARI(NII),ATTR(NII))=%VAL D VALID(NII+1)
 Q
AFFPT(FC) I (FC#10)=0 S DY=20,DX=30+((FC\10)#45) X XY W ". "
 Q
VAL 
 N B,CA,FC,I,IN,%IN,TOP,GL,TY,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S B=$$RED^%ANA(AR,"REPERTOIRE"),TOP=$$RED^%ANA(AR,"ATTRIBUT")
 S (C,^CXZ($J))=^CXZ($J)+1,AD="^CXZ($J,"_C_")"
 I BD=B S A=LDE G SVAL
 S A=$$LISTIND^%QSGEST6(B)
SVAL S I=0,CA=0,IN="",GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VALTEMP")
 F %IN=0:0 S IN=$O(@A@(IN)) Q:(IN="")!(IN="z")  K @(GL) D MVG^%QSCALVA(B,IN,TOP,GL,.TY) S FC="" F %I=0:0 S FC=$O(@GL@(FC)) Q:FC=""  I '($D(^CXZ($J,C,IN,FC))) S I=I+1 D:OKECR AFFPT(I) S CA=CA+1,^CXZ($J,C,IN,@GL@(FC))=@GL@(FC)
 K @(GL)
 S ^CXZ($J,C)=CA,BD=B
 
 S CD=CA Q
REQ 
 N B,TOP,TYP,BA,BAI,BA2,ADRREQ,ARRET,LDEP,ARBR,FOCA,BASE,IND,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S TOP=$$RED^%ANA(AR,"ARBRE")
 S TYP=$$RED^%ANA(TOP,"TYPE")
 G:TYP="COMPARATEUR.TERNAIRE" TERNA
BINAI S FOCA=$$REQ2^%QSCANON(TOP,.IND) G STI1
TERNA S FOCA=$$REQ3^%QSCANON(TOP,.IND)
STI1 I FOCA="" D:OKECR ^%VZEAVT($$^%QZCHW("Erreur : impossible de calculer la forme canonique ...")) S CD=0 Q
 I $L(FOCA)>220 D:OKECR ^%VZEAVT($$^%QZCHW("Micro-requete trop longue : veuillez la separer en plusieurs micro-requetes...")) S CD=0 Q
 S BA=$$RED^%ANA(TOP,"BASE"),BAI=$$NOMINT^%QSF(BA) S:BAI="" BAI=BA
 S ARRET=0
 I BAI=BD G SSTI1
 
 
 I SOUR="" S A22=LDE,SOUR=$$LISTIND^%QSGEST6(BAI)
 S ADRREQ="STI1S^%QSACTI2",LDEP=SOUR,ARBR=TOP,BASE=BAI
 G GO^%QS1CALC
STI1S S (BA2,BD)=BAI,(AD,SOUR)="^[QUI]RQS3($J,"_""""_BA2_""","""_$$ZSUBST^%QZCHSUB(FOCA,"""","""""")_""",""OBJET"""_")"
 G SSTI2
SSTI1 
 S ADRREQ="SSTI1S^%QSACTI2",LDEP=LDE,ARBR=TOP,BASE=BAI
 G GO^%QS1CALC
SSTI1S S BA2=BAI,(AD,SOUR)="^[QUI]RQS3($J,"_""""_BA2_""","""_$$ZSUBST^%QZCHSUB(FOCA,"""","""""")_""",""OBJET"""_")"
SSTI2 
 D USE^%QS1CALC(FOCA,BAI)
 S CD=^[QUI]RQS3($J,BA2,FOCA,"CARD")
 
 Q
 
INTER 
 
 
 S AD=A,CD=CA
 I $$GET^%SGVAR("ECR") D POCLEPA^%VVIDEO W $$^%QZCHW("Intersection --> "),CD,$$^%QZCHW(" individus")
 Q
CHEM 
 N BID,DEST,SSO
 S DEST=$$RED^%ANA(AR,"DESTINATION"),DES=$$NOMINT^%QSF(DEST) S:DES="" DES=DEST
 S SSO=$$RED^%ANA(AR,"SOURCE")
 I SOUR'="" G SCHEM
 
 S ^CXZ($J)=^CXZ($J)+1,AD="^CXZ($J,"_^CXZ($J)_")"
 S CD=$$^%QSGRELL($$RED^%ANA(AR,"SOURCE"),LDE,$$RED^%ANA(AR,"CHEMIN"),DES,LDD,BDD,AD),BD=DES
 I $$GET^%SGVAR("ECR") D POCLEPA^%VVIDEO W $$^%QZCHW("Chemin --> "),CD,$$^%QZCHW(" individus")
 Q
SCHEM S ^CXZ($J)=^CXZ($J)+1,AD="^CXZ($J,"_^CXZ($J)_")"
 S CD=$$^%QSGRELL($$RED^%ANA(AR,"SOURCE"),SOUR,$$RED^%ANA(AR,"CHEMIN"),DES,A22,BDD,AD),SOUR="",BD=DES
 
 
 Q

