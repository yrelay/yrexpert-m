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

;%QUOLST2^INT^1^59547,73886^0
QUOLST2 ;
 
 
 
 
 
 
 
 
 
 
 
 
AFFICH(IN) 
 N A,BUF,COL,%F,I,J,L,LC,LD,LF,OK,SX,SY,V,X,X1,XC,Y,YC,NC
 D INIT
 D CADR,TIT,PAG(LD)
 Q
 
 
INIT 
 N X
 S A=@IN@("A"),COL=1
 S LD=1,LF=(LD+@IN@("H"))-6,NC=$ZP(@IN@("LI",""))
 S XC=@IN@("X")+2,YC=@IN@("Y")+3
 S:'($D(@IN@("TI"))) @IN@("TI")=""
 S LC=1,BUF="",PA=1
 S MODE=$S($D(@IN@("CHI")):0,1:1)
 I MODE=1 S XC=(@IN@("X")+1)+@IN@("LI",1,"X") Q
 
 S X=@IN@("X")
 F COL=1:1:NC S XC=(X+1)+@IN@("LI",COL,"X") I '($D(@IN@("CHI",COL))) Q
 Q
 
 
AFF 
 D CADR,TIT,PAG(LD),HELP
 Q
 
CADR 
 D CARSP^%VVIDEO(@IN@("X"),@IN@("Y"),@IN@("H"),@IN@("L"),1)
 Q
 
TIT 
 Q:@IN@("TI")=""
 S DX=((@IN@("X")+(@IN@("L")\2))-($L(@IN@("TI"))\2))-1,DY=@IN@("Y")
 D BLD^%VVIDEO,REV^%VVIDEO X XY W " ",@IN@("TI")," " D NORM^%VVIDEO
 Q
 
HELP 
 S DX=@IN@("X")+2,DY=(@IN@("H")+@IN@("Y"))-1
 X XY W " " D XY^%VZCFLE I MODE=1 W $E($$^%QZCHW("CTRLH aide, CTRLL pour inserer, CTRLG pour supprimer"),1,@IN@("L")-13)
 I MODE=0 W $E($$^%QZCHW("CTRLH aide"),1,@IN@("L")-13)
 Q
 
PAG(N) 
 S X=@IN@("X"),L=@IN@("L")-2,DY=@IN@("Y")+1
 S DX=X+1 X XY W $J("",L)
 D REV^%VVIDEO
 
 F I=1:1:NC S DX=(X+1)+@IN@("LI",I,"X") X XY W:$D(@IN@("LI",I,"T")) @IN@("LI",I,"T")
 
 D NORM^%VVIDEO S DY=DY+1,DX=X+1 X XY W $J("",L)
 S DY=((@IN@("Y")+2)+N)-LD
 F I=N:1:LF Q:'($D(@A@(I)))  S DY=DY+1,DX=X+1 X XY W $J("",L) S X1=@A@(I) F J=1:1:NC S DX=(X+1)+@IN@("LI",J,"X") X XY W $E($P(X1,"^",J),1,($S(J=NC:@IN@("L"),1:@IN@("LI",J+1,"X"))-@IN@("LI",J,"X"))-1)
 D CLE(I)
 Q
CLE(N) 
 N I
 I (N=LF)&$D(@A@(N)) Q
 S DX=@IN@("X")+1,DY=((@IN@("Y")+3)+N)-LD
 F I=N:1:LF X XY W $J("",@IN@("L")-2) S DY=DY+1
 Q
 
VAL 
 S DX=@IN@("X")+1,DY=(@IN@("Y")+@IN@("H"))-2 X XY W $J("",@IN@("L")-2)
 S V=$S('($D(@A@(LC))):"",1:$P(@A@(LC),"^",COL))
 S DX=((@IN@("L")\2)+@IN@("X"))-($L(V)\2) X XY
 D BLD^%VVIDEO,REV^%VVIDEO X XY W V
 D NORM^%VVIDEO Q
 
 
IMPR 
 N SOR,DX
 S SOR=$$TABID^%INCOIN("PRINTER") I SOR="" D ^%VZEAVT($$^%QZCHW("L'imprimante n'est pas definie")) Q
 S X=@IN@("X")
 D MSG^%VZEATT($$^%QZCHW("Impression en cours")) O SOR U SOR
 
 I @IN@("TI")'="" W !,?((X+(@IN@("L")\2))-($L(@IN@("TI"))\2))-1," ",@IN@("TI")," ",!
 W !
 
 F I=1:1:NC S DX=(X+1)+@IN@("LI",I,"X") W ?DX,"" W:$D(@IN@("LI",I,"T")) @IN@("LI",I,"T")
 
 F I=LC:1 Q:'($D(@A@(I)))  W ! S X1=@A@(I) F J=1:1:NC S DX=(X+1)+@IN@("LI",J,"X") W ?DX,$E($P(X1,"^",J),1,($S(J=NC:@IN@("L"),1:@IN@("LI",J+1,"X"))-@IN@("LI",J,"X"))-1)
 W #
 C SOR D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 Q
 
 
AIDE 
 N C,CH,I
 D EFF
 S DX=@IN@("X")+2,DY=@IN@("Y")+1,I=1
BI G:DY=((@IN@("Y")+@IN@("H"))-1) FPA
 S CH=$T(FUN+I) G:$P(CH,";;",2)="" END
 
 I MODE=0,(((CH["CTRLP")!(CH["CTRLD"))!(CH["CTRLG"))!(CH["CTRLL") S I=I+1 G BI
 I DTM,CH["CTRLR" S CH=$$ZSUBST^%QZCHSUB(CH,"CTRLR","CTRLW")
 I DTM,CH["CTRLA" S CH=$$ZSUBST^%QZCHSUB(CH,"CTRLA",$S(MODTM:"ESCP",1:"BREAK"))
 X XY W $E($$^%QZCHW($P(CH,";;",2)),1,@IN@("L")-4)
 S DY=DY+1,I=I+1 G BI
END 
 I DY'=(@IN@("Y")+1) D ^%VZEAVT("")
 D AFF
 Q
FPA 
 D ^%VZEAVT(""),EFF
 S DY=@IN@("Y")+1,DX=@IN@("X")+2
 G BI
EFF N LI S LI=$J("",@IN@("L")-2)
 S DX=@IN@("X")+1,DY=@IN@("Y")+1 X XY W LI
 S DY=DY+1 X XY W LI
 D CADR,CLE(LD)
 X XY W LI Q
FUN 
 ;;CTRLA fin
 ;;CTRLF fin
 ;;CTRLG supprime une ligne
 ;;CTRLI modifie une colonne
 ;;CTRLH aide
 ;;CTRLJ imprime
 ;;CTRLP prend une ligne
 ;;CTRLD depose une ligne prise par CTRLP
 ;;CTRLR reaffiche
 ;;CTRLL insere une ligne
 ;;  
 ;;fleche vers la droite --> colonne de droite
 ;;fleche vers la gauche --> colonne de gauche
 ;;fleche vers le haut   --> ligne precedente
 ;;fleche vers le bas    --> ligne suivante
 ;;+                     --> page suivante
 ;;-                     --> page precedente
 ;;.                     --> acces a une page
 ;;
 
 
TEST 
 G TEST^%QUOLST3

