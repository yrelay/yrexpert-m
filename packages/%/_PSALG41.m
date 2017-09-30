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

;%PSALG41^INT^1^59547,73874^0
%PSALG41 ;;02:51 PM  23 Apr 1992;
 
 
 
 
 
 
T(ROUTINE,OI,BUT,R,GFLUX) 
 N D,Q,q,RS,OK,PDSC
 N PILE,JOURN,REUSSITE,LISTOBJ,ENSOP,DIFF,STONXT
 N CALDIFF,AXIOMBA,NODIFF,TROLOIN,CHOIXOPE,APPLIQUE,VISU
 N IPIL,IJO,IFIN,ECHANT,OBJET,OBJ,STO,%RES,ABAND
 S ABAND=0
 D INITMP
 S CALDIFF=$XECUTE("D "_@ROUTINE@("CDIF")_"(OBJET,BUT,DIFF,GFLUX)")
 S MKENSOP=$XECUTE("D "_@ROUTINE@("MKENSOP")_"(DIFF,ENSOP,GFLUX)")
 S NODIFF=$XECUTE("S %RES="_@ROUTINE@("NODIFF")_"(DIFF,GFLUX)")
 S TROPLOIN=$XECUTE("S %RES="_@ROUTINE@("TROPLOIN")_"(DPRED,DIFF,IPIL,GFLUX)")
 S APPLIQUE=$XECUTE("S %RES="_@ROUTINE@("APPLIQUE")_"(OBJET,OPE,.OBJNXT,GFLUX)")
 S AXIOMBA=$XECUTE("S %RES="_@ROUTINE@("AXIOMBA")_"(OBJET,GFLUX)")
 S VISU=$S($D(@ROUTINE@("VISU")):$XECUTE("D "_@ROUTINE@("VISU")_"(OBJET,GFLUX)"),1:"")
 S RECUSE=$S($D(@ROUTINE@("RECUSE")):$XECUTE("D "_@ROUTINE@("RECUSE")_"(OBJET,OPE,GFLUX)"),1:"")
 
 S IPIL=1,ECHANT=1,IJO=1,IFIN=0
 S PILE=$$TEMP,JOURN=$$TEMP,REUSSITE=$$TEMP,LISTOBJ=$$TEMP
 
 S OBJET=OI X VISU
 S @LISTOBJ@(OBJET)=""
 
 S @JOURN@(IJO,"IO")=OBJET,@JOURN@(IJO,"TXT")="initialisation",@JOURN@(IJO,"PR",0)="",@JOURN@(IJO,"CUT")=0,@JOURN@(IJO,"TY")="I"
 
 S STO=$$TEMP
 S @PILE@(IPIL,"IO")=OBJET,@PILE@(IPIL,"ST")=STO,@PILE@(IPIL,"IJ")=IJO
 S (CHEM,@PILE@(IPIL,"C"))=""
 
 X AXIOMBA I '(%RES) G FIN
 S ENSOP=$$CONCAS^%QZCHAD(STO,"E"),DIFF=$$CONCAS^%QZCHAD(STO,"D")
 X CALDIFF
 X NODIFF G:%RES REUS0
 
NEXT S ENSOP=$$CONCAS^%QZCHAD(STO,"E")
 X MKENSOP
 S @PILE@(IPIL,"EC")=""
 
BCL S OBJET=@PILE@(IPIL,"IO") X VISU
 S STO=@PILE@(IPIL,"ST")
 S ENSOP=$$CONCAS^%QZCHAD(STO,"E")
 S @PILE@(IPIL,"EC")=$O(@ENSOP@(@PILE@(IPIL,"EC")))
 I @PILE@(IPIL,"EC")="" S DX=12,DY=4 X XY W "niveau "_IPIL S DX=4,DY=6 X XY W "recusation" G RETOUR
 S OPE=@ENSOP@(@PILE@(IPIL,"EC"))
 S @PILE@(IPIL,"OP")=OPE
 S STONXT=$$TEMP
 S DX=12,DY=4 X XY W "niveau "_IPIL S DX=4,DY=6 X XY W "operateur "_OPE
 S SAVOBJ=OBJET
 X APPLIQUE
 G:ABAND FIN
 I '(%RES) K @(STONXT) G BCL
 S DPRED=$$CONCAS^%QZCHAD(STO,"D")
 S STO=STONXT,OBJET=OBJNXT
 
 X AXIOMBA I '(%RES) S OBJET=SAVOBJ X RECUSE G BCL
 S DIFF=$$CONCAS^%QZCHAD(STO,"D")
 X CALDIFF
 X NODIFF G:%RES REUS
 X TROPLOIN I %RES S OBJET=SAVOBJ X RECUSE G CUT
 S IJO=IJO+1
 S @JOURN@(IJO,"PR",@PILE@(IPIL,"IJ"))="",@JOURN@(IJO,"CUT")=0,@JOURN@(IJO,"IO")=OBJET
 I '($D(@LISTOBJ@(OBJET))) S @LISTOBJ@(OBJET)="" G SUITE
 
 
 
 F %IP=1:1:IPIL I @PILE@(%IP,"IO")=OBJET S @JOURN@(IJO,"TXT")="cycle",OBJET=SAVOBJ X RECUSE G BCL
 F %IP=1:1:IJO I @JOURN@(%IP,"IO")=OBJET S @JOURN@(IJO,"TXT")="etat deja vu, deroutement sur "_%IP,OBJET=SAVOBJ X RECUSE G BCL
 
SUITE S @JOURN@(IJO,"TXT")="passage a l'etat suivant par application de "_OPE
 S @JOURN@(IJO,"TY")="P"
 S IPIL=IPIL+1
 S @PILE@(IPIL,"ST")=STO,(@PILE@(IPIL,"C"),CHEM)=CHEM_" o "_OPE
 S @PILE@(IPIL,"IJ")=IJO
 S @PILE@(IPIL,"IO")=@JOURN@(IJO,"IO")
 S @PILE@(IPIL,"R")=OPE
 G NEXT
 
RETOUR K @(STO) S STO=@PILE@(IPIL,"ST") K @(STO)
 K @PILE@(IPIL)
 S IPIL=IPIL-1 G:IPIL=0 FIN
 S IJO=IJO+1
 S @JOURN@(IJO,"TY")="R",(@JOURN@(IJO,"IO"),IOBJ)=@PILE@(IPIL,"IO")
 S @JOURN@(IJO,"TXT")="recusation"
 S @JOURN@(IJO,"PR",@PILE@(IPIL,"IJ"))=""
 S @JOURN@(IJO,"CUT")=0
 S CHEM=@PILE@(IPIL,"C")
 S OBJET=@PILE@(IPIL,"IO"),OPE=@PILE@(IPIL,"OP") X RECUSE
 G BCL
 
CUT S X=IJO
CUTBC S @JOURN@(X,"CUT")=1,X=$O(@JOURN@(X,"PR","")) G:X="" BCL G:X=0 BCL
 G CUTBC
 
FIN I '($D(@REUSSITE)) Q 0
 S R=OBJET
 
 Q 1
PRINT(IJ) I IJ=0 W ! Q
 N A S A="" F  S A=$O(@JOURN@(IJ,"PR",A)) Q:A=""  D PRINT(A) W " ",IJ
 Q
REUS 
 
 
 
 
 X VISU
 S IJO=IJO+1
 S @JOURN@(IJO,"PR",IJO-1)=""
 S @JOURN@(IJO,"CUT")=0,@JOURN@(IJO,"IO")=OBJET,@JOURN@(IJO,"TY")="F"
 
 S @JOURN@(IJO,"TXT")="BUT ATTEINT par application de "_OPE_", arret"
 S @REUSSITE@(IJO)=""
 
 G FIN
 
REUS0 S @JOURN@(IJO,"TXT")="L'objet initial remplit les conditions du but"
 S @REUSSITE@(IJO)=""
 G FIN
 
 
AFFI(IP,MES) N M
 S M="niveau "_IP_" : "_MES
 S DX=4,DY=10 X XY W $E(M,1,70)
 Q
 
IMPJOURN 
 S IJO=1
IMP2 S IJO=$O(@JOURN@(IJO)) Q:IJO=""
 W !,IJO,"  ",@JOURN@(IJO,"TXT")
 G IMP2
 
INITMP N G S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"")"
 I '($D(@G)#10) S @G=0
 Q
 
TEMP() N G
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"")"
 S @G=@G+1 Q "^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"","_@G_")"
 ;

