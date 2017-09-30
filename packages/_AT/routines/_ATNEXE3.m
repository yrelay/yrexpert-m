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

;%ATNEXE3^INT^1^59547,73866^0
%ATNEXE3 ;;11:46 AM  16 Dec 1992; ; 26 Apr 93 11:14 AM
 
 
INIAFF() 
 N TEMP,GRA,STRVISU,GROOT,TIT
 S TEMP=$$TEMP^%SGUTIL
 S @TEMP@("FULL")="$$FULL^%ATNEXE3"
 S @TEMP@("AFF")="$$AFF^%ATNEXE3"
 S @TEMP@("MODEAFF")="$$MODEAFF^%ATNEXE3"
 S @TEMP@("INFO")="$$INFO^%ATNEXE3"
 S @TEMP@("TRI")="$$TRI^%ATNEXE3"
 S GRA=$$CONCAS^%QZCHAD(%VNI(%VNGA,3),"T")
 S GROOT=$$CONCAS^%QZCHAD(%VNI(%VNGA,3),"O")
 S TIT="1"_$C(0)_"10"_$C(0)_"etude "_%VNE(%VNGA,2)_" (reseau "_%VNE(%VNGA,1)_")"
 S STRVISU=$$INIT^%QULELV(GRA,GROOT,$S($D(@%VNI(%VNGA,3)@("LVISU")):@%VNI(%VNGA,3)@("LVISU"),1:12),3,TEMP,TIT,0,1)
 K @(TEMP)
 Q STRVISU
 
 
MKMEN S @%MN="20^10^79"
 S @%MN@(2)=$$^%QZCHW("Lancer execution")_"^LANCER"
 S @%MN@(2,"COM")=$$^%QZCHW("Lancer l'execution depuis le noeud actuel")
 S @%MN@(1)=$$^%QZCHW("Pas suivant")_"^PAS"
 S @%MN@(3)=$$^%QZCHW("Documentation")_"^DOC"
 S @%MN@(3,"COM")=$$^%QZCHW("Visualisation de la documentation associee au noeud actuel")
 S @%MN@(4)=$$^%QZCHW("Nombre pas")_"^NBPAS"
 S @%MN@(4,"COM")=$$^%QZCHW("Execution automatique pendant un nombre de pas a preciser")
 S @%MN@(5)=$$^%QZCHW("Abandon")_"^ABAND"
 S @%MN@(5,"COM")=$$^%QZCHW("Abandon de l'etude")
 D FINMENU^%ATNUT2(%MN,%VNE(%VNGA,1))
 Q
 
GETNBPAS() 
 N CTR,YY1
 S DX=1,DY=20 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nombre de pas a effectuer")_" : ","",1,75,21,21,"","",.CTR,.YY1)
 Q:CTR'="" 1
 Q YY1
 
 
JOURNAL(MSG) 
 S %VNI(%VNGA,4)=%VNI(%VNGA,4)+1
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"D",%VNI(%VNGA,4))=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE_" "_MSG
 Q
 
INFO(TP) 
 Q ""
 
FULL(TP) 
 N ND S ND=@TP@("O") Q $$VALEX(ND)
 
AFF(RIVX,LG) 
 N ND S ND=@RIVX Q $$VALEX(ND)
 
 
VALEX(ND) N ND2
 I '($D(@%VNI(%VNGA,3)@("TITRE",ND))) Q ND
 S ND2=@%VNI(%VNGA,3)@("TITRE",ND) Q ND2
 
MODEAFF(RIVX) 
 N ND
 S ND=@RIVX
 I $D(@%VNI(%VNGA,3)@("O",ND))#10,@%VNI(%VNGA,3)@("O",ND) Q "BLK"
 I $D(@%VNI(%VNGA,3)@("PETRI",ND))#10 Q "BLD"
 Q "NORM"
 
TRI(SOM1,SOM2) 
 N COEFF,%C
 Q:SOM1="" 5E-1 Q:SOM2="" 5E-1
 S COEFF="" F %C=0:0 S COEFF=$O(@%VNI(%VNGA,3)@("R",SOM1,COEFF)) Q:COEFF=""  Q:$D(@%VNI(%VNGA,3)@("R",SOM1,COEFF,SOM2))
 Q:COEFF'="" COEFF Q 5E-1
 
VISIBLE(ATN) 
 N GLO,VISI
 S GLO="^[QUI]RQSGLO(""ATN"")"
 I '($D(@GLO@(ATN,"GETCARA","VISIBLE"))) Q 1
 S @("VISI="_@GLO@(ATN,"GETCARA","VISIBLE"))
 Q VISI
 
SUPETU(ATN) 
 N GLO,VISI
 S GLO="^[QUI]RQSGLO(""ATN"")"
 I '($D(@GLO@(ATN,"GETCARA","SUPETU"))) Q 1
 S @("VISI="_@GLO@(ATN,"GETCARA","SUPETU"))
 Q VISI

