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

;%PSALGO4^INT^1^59547,73874^0
%PSALGO4 ;;12:40 PM  4 Dec 1991;
 
 
 
 
 
T(ROUTINE,OI,BUT,R) 
 N D,Q,q,RS,OK,ECHANT,PDSC
 N PILE
 N CALDIFF,AXIOMBA,NODIFF,TROLOIN,CHOIXOPE,APPLIQUE
 N VISU
 S CALDIFF=$XECUTE("D "_@ROUTINE@("CDIF")_"(OBJET,BUT,DIFF)")
 S MKENSOP=$XECUTE("D "_@ROUTINE@("MKENSOP")_"(DIFF,ENSOP)")
 S NODIFF=$XECUTE("S %RES="_@ROUTINE@("NODIFF")_"(DIFF)")
 S TROPLOIN=$XECUTE("S %RES="_@ROUTINE@("TROPLOIN")_"(DPRED,DIFF,IPIL)")
 S APPLIQUE=$XECUTE("S %RES="_@ROUTINE@("APPLIQUE")_"(OBJET,OPE,OBJNXT)")
 S AXIOMBA=$XECUTE("S %RES="_@ROUTINE@("AXIOMBA")_"(OBJET)")
 S VISU=$XECUTE("D "_@ROUTINE@("VISU")_"(OBJ)")
 S IPIL=1,ECHANT=1,IJO=1,IFIN=0
 S PILE=$$TEMP
 S JOURN=$$TEMP
 S LISTOBJ=$$TEMP
 S REUSSITE=$$TEMP
 
 S OBJET=$$TEMP
 D COPY^%QCAGLC(OI,OBJET)
 S @LISTOBJ=1,@LISTOBJ@(@LISTOBJ)=OBJET
 
 S OBJ=OBJET X VISU
 
 S @JOURN@(IJO,"IO")=@LISTOBJ
 S @JOURN@(IJO,"TXT")="initialisation"
 S @JOURN@(IJO,"PR",0)=""
 S @JOURN@(IJO,"CUT")=0
 S @JOURN@(IJO,"TY")="I"
 
 S STO=$$TEMP
 S @PILE@(IPIL,"IO")=@LISTOBJ
 S @PILE@(IPIL,"ST")=STO
 S @PILE@(IPIL,"IJ")=IJO
 S @PILE@(IPIL,"COUT")=0
 S (CHEM,@PILE@(IPIL,"C"))=""
 
 X AXIOMBA G:'(%RES) ECHEC0
 S ENSOP=$$CONCAS^%QZCHAD(STO,"E")
 S DIFF=$$CONCAS^%QZCHAD(STO,"D")
 X CALDIFF
 X NODIFF G:%RES REUS0
 
NEXT S ENSOP=$$CONCAS^%QZCHAD(STO,"E")
 X MKENSOP
 S @PILE@(IPIL,"EC")=""
 
BCL S IOBJ=@PILE@(IPIL,"IO"),OBJET=@LISTOBJ@(IOBJ)
 S STO=@PILE@(IPIL,"ST")
 S ENSOP=$$CONCAS^%QZCHAD(STO,"E")
 S @PILE@(IPIL,"EC")=$O(@ENSOP@(@PILE@(IPIL,"EC")))
 G:@PILE@(IPIL,"EC")="" RETOUR
 S OBJ=OBJET X VISU
 S OPE=@ENSOP@(@PILE@(IPIL,"EC"))
 S STONXT=$$TEMP
 S OBJNXT=$$TEMP
 X APPLIQUE
 I '(%RES) K @(STONXT) G BCL
 S DPRED=$$CONCAS^%QZCHAD(STO,"D")
 S STO=STONXT,OBJET=OBJNXT
 
 X AXIOMBA G:'(%RES) BCL
 S DIFF=$$CONCAS^%QZCHAD(STO,"D")
 X CALDIFF
 X NODIFF G:%RES REUS
 X TROPLOIN G:%RES CUT
 S IJO=IJO+1
 S @JOURN@(IJO,"PR",@PILE@(IPIL,"IJ"))=""
 S @JOURN@(IJO,"CUT")=0
 
 F %IP=1:1 G:%IP>@LISTOBJ SUITE Q:$$EGALGLO^%QCAGLC(OBJET,@LISTOBJ@(%IP))
 
 
 S @JOURN@(IJO,"IO")=%IP
 F %II=1:1:IPIL I @PILE@(%II,"IO")=%IP S @JOURN@(IJO,"TXT")="application de "_OPE_" => reconnaissance d'un cycle",@JOURN@(IJO,"NX")=IJO+1,@JOURN@(IJO,"TY")="C" G BCL
 S VU=0
 F %II=1:1:IJO-1 I @JOURN@(%II,"IO")=%IP,@JOURN@(%II,"TY")="P",'(@JOURN@(%II,"CUT")) S VU=1 Q
 G:'(VU) SUITE2
 S @JOURN@(IJO,"TXT")="application de "_OPE_" => reconnaissance d'un objet connu et deroutement ("_%II_")"
 S @JOURN@(IJO,"TY")="T"
 S @JOURN@(%II,"PR",IJO)=""
 G BCL
SUITE S @LISTOBJ=@LISTOBJ+1
 S @LISTOBJ@(@LISTOBJ)=OBJET
 S @JOURN@(IJO,"IO")=@LISTOBJ
SUITE2 
 S @JOURN@(IJO,"TXT")="passage a l'etat suivant par application de "_OPE
 S @JOURN@(IJO,"TY")="P"
 S IPIL=IPIL+1
 S @PILE@(IPIL,"ST")=STO,(@PILE@(IPIL,"C"),CHEM)=CHEM_" o "_OPE
 S @PILE@(IPIL,"IJ")=IJO
 S @PILE@(IPIL,"IO")=@JOURN@(IJO,"IO")
 S @PILE@(IPIL,"R")=OPE
 G NEXT
 
RETOUR K @(STO)
 S STO=@PILE@(IPIL,"ST") K @(STO)
 K @PILE@(IPIL)
 S IPIL=IPIL-1 G:IPIL=0 FIN
 S IJO=IJO+1
 S @JOURN@(IJO,"TY")="R"
 S (@JOURN@(IJO,"IO"),IOBJ)=@PILE@(IPIL,"IO")
 S @JOURN@(IJO,"TXT")="recusation"
 S @JOURN@(IJO,"PR",@PILE@(IPIL,"IJ"))=""
 
 S @JOURN@(IJO,"CUT")=0
 S CHEM=@PILE@(IPIL,"C")
 G BCL
 
CUT S X=IJO
CUTBC S @JOURN@(X,"CUT")=1
 S X=$O(@JOURN@(X,"PR","")) G:X="" BCL G:X=0 BCL
 G CUTBC
 
FIN I '($D(@REUSSITE)) Q 0
 
 Q 1
PRINT(IJ) I IJ=0 W ! Q
 N A S A="" F  S A=$O(@JOURN@(IJ,"PR",A)) Q:A=""  D PRINT(A) W " ",IJ
 Q
REUS 
 
 
 
 
 S OBJ=OBJET X VISU
 S IJO=IJO+1
 S @JOURN@(IJO,"PR",IJO-1)=""
 I '(IFIN) S (IFIN,@LISTOBJ)=@LISTOBJ+1,@LISTOBJ@(IFIN)=OBJET
 S @JOURN@(IJO,"CUT")=0
 S @JOURN@(IJO,"IO")=IFIN
 S @JOURN@(IJO,"TY")="F"
 
 S @JOURN@(IJO,"TXT")="BUT ATTEINT par application de "_OPE_", arret"
 S @REUSSITE@(IJO)=""
 
 G FIN
 
REUS0 S @JOURN@(IJO,"TXT")="L'objet initial remplit les conditions du but"
 S @REUSSITE@(IJO)=""
 G FIN
 
 
COUT(OPE) Q 1
 
IMPJOURN 
 S IJO=1
IMP2 S IJO=$O(@JOURN@(IJO)) Q:IJO=""
 W !,IJO,"  ",@JOURN@(IJO,"TXT")
 G IMP2
 
 
TEMP() N G
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"")"
 I '($D(@G)#10) S @G=0
 S @G=@G+1 Q "^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"","_@G_")"
 ;

