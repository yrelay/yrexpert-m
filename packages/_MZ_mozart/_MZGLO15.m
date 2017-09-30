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

;%MZGLO15^INT^1^59547,73871^0
MOZGLO15 ;;04:01 PM  18 May 1990; 03 Mar 89  6:25 PM ; 07 Jun 93  4:48 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",12,5,0)=^90019.03^27^6
 ;;^MOZ("C",12,5,1,0)=^^(A)BANDON^sortir sans sauvegarder
 ;;^MOZ("C",12,5,1,1)=D NORM^%VVIDEO S DX=11 X XY W "ABANDON" D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Sortie immediate"),"O") D POCLEPA^%VVIDEO Q:(REP=0)!(REP=-1)  S %="Q"
 ;;^MOZ("C",12,5,2,0)=^^(B)UFFER^deposer des lignes (M)
 ;;^MOZ("C",12,5,2,1)=Q  ;D WB^%MZEDSF
 ;;^moz("C",12,5,3,0)=(C)ARTOUCHE^acces a la grille
 ;;^moz("C",12,5,3,1)=W "CARTOUCHE" D ^%MZINFO
 ;;^MOZ("C",12,5,4,0)=^^(D)EPOSER^un groupe de ligne
 ;;^MOZ("C",12,5,4,1)=D WB^%MZEDSF
 ;;^MOZ("C",12,5,5,0)=(E)FFACER^un groupe de lignes (P)
 ;;^MOZ("C",12,5,5,1)=D ERASE^%MZINSER
 ;;^MOZ("C",12,5,6,0)=^^(F)IN^sauvegarder et sortir
 ;;^MOZ("C",12,5,6,1)=D NORM^%VVIDEO S DX=11 X XY W "FIN" D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Confirmation "),"N") D POCLEPA^%VVIDEO Q:(REP=0)!(REP=-1)  S %SA=1,@%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X D SAV^%MZWORD S %="Q",%SA=0
 ;;^MOZ("C",12,5,8,0)=^^(H)ELP^help
 ;;^MOZ("C",12,5,8,1)=Q  ;W "AIDE memoire" S SET=5 D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",12,5,9,0)=(I)NSERER^un groupe de lignes (P)
 ;;^MOZ("C",12,5,9,1)=D ^%MZINSER Q
 ;;^MOZ("C",12,5,12,0)=(L)IRE^lire une gamme
 ;;^MOZ("C",12,5,12,1)=W "LIRE" S %SA="L" D FILE^%MZWORD S %=0 Q:CTR="A"  Q:PGM=EMP  D LOAD^%MZWORD S %="S",%SA=0 X ^MOZ("C",12,6) O 0
 ;;^MOZ("C",12,5,13,0)=^^(M)OVE^effacer des lignes (B)
 ;;^MOZ("C",12,5,13,1)=Q  ;D RB^%MZEDSF
 ;;^MOZ("C",12,5,16,0)=(P)RENDRE^un groupe de lignes
 ;;^MOZ("C",12,5,16,1)=D ^%MZPREND Q
 ;;^MOZ("C",12,5,17,0)=^^(Q)UIT^sortir sans sauvegarder
 ;;^MOZ("C",12,5,17,1)=W "ABANDON" S %="Q"
 ;;^MOZ("C",12,5,18,0)=^^(R)EAD^lire une gamme
 ;;^MOZ("C",12,5,18,1)=Q  ;W "LIRE" S %SA="L" D FILE^%MZWORD S %=0 Q:CTR="A"  Q:PGM=EMP  D LOAD^%MZWORD S %="S",%SA=0 X ^MOZ("C",12,6) O 0
 ;;^MOZ("C",12,5,19,0)=(S)AUVEGARDE^sauvegarder sans sortir
 ;;^MOZ("C",12,5,19,1)=W "SAUVEGARDER" S %SA=1 D FILE^%MZWORD S %=0 Q:PGM=EMP  S @%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X D SAV^%MZWORD S X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1),%=0,%SA=0
 ;;^MOZ("C",12,5,23,0)=^^(W)RITE^sauvegarder sans sortir
 ;;^MOZ("C",12,5,23,1)=Q  W "SAUVEGARDER" S %SA=1 D FILE^%MZWORD S %=0 Q:PGM=EMP  S @%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X D SAV^%MZWORD S X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1),%=0,%SA=0
 ;;^MOZ("C",12,5,27,0)=^^ESC^help
 ;;^MOZ("C",12,5,27,1)=Q  ;W "HELP" S SET=5 D H^%MZINSF S EDLL=EDSL,%=3
 ;;^moz("C",12,6)=S BS="$C(8)",FF="#,*27,*91,*50,*74,*27,*91,*72",RM=80,SL=24,XL="W *27,*91,*75",A=1 W *27,"="
 ;;^MOZ("C",12,6)=S BS="$C(8)",FF="#,*27,*91,*50,*74,*27,*91,*72",RM=80,SL=24,XL="W $J("""",80-$X)",A=1 D APPKP^%VVIDEO
 ;;^MOZ("C",12,7)=K A D NUMKP^%VVIDEO
 ;;^MOZ("C","B","EDT VT52 INPUT",10)=
 ;;^MOZ("C","B","EDT VT52 SIMULATOR",9)=
 ;;^MOZ("C","L",1)=Oper,1/MACHINE,8/Rempl 1,22/Rempl 2,31/Pst main,44/C.R,57/Tps pr,61/Tps fab,68
 ;;^MOZ("C","L",2)=ACTION,10/OBJET,30/MANIERE,50/OUTIL,70
 ;;^MOZ("MOZ","C","PARA")=ACTION,OBJET,MACHINE,OUTIL,MANIERE
 ;;^MOZ("STAND","C","PARA")=ACTION,OBJET,MACHINE,OUTIL,MANIERE
 ;;^MOZ("QUERY","STAND",1)=NUMERO.OPERATION,MACHINE,MACHINE.REMPLACEMENT^1,MACHINE.REMPLACEMENT^2,POSTE.MAIN,NOMBRE.EXEMPLAIRES,COEFFICIENT.REMPLACEMENT,*,TEMPS.PREPARATION,TEMPS.FABRICATION,CODE.CASCADE
 ;;^MOZ("QUERY","STAND",2)=OPERATION.MOZART,OBJET,MANIERE,OUTIL
 ;;^MOZ("GRILLE","TRAZOM","STAND",1)=MOZLIGN1
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,1)=NUMERO.OPERATION^^1^Numero d'operation^2
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,2)=MACHINE^^7^Machine^7
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,3)=MACHINE.REMPLACEMENT^1^20^Machine de remplacement (1)^7
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,4)=MACHINE.REMPLACEMENT^2^29^Machine de remplacement (2)^7
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,5)=POSTE.MAIN^1^38^Poste.main^7
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,6)=NOMBRE.EXEMPLAIRES^1^52^Nombre d'exemplaires^
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,7)=COEFFICIENT.REMPLACEMENT^1^58^Coefficient de remplacement^
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,8)=TEMPS.PREPARATION^^62^Temps de preparation^
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,9)=TEMPS.FABRICATION^^68^Temps de fabrication^
 ;;^MOZ("GRILLE","TRAZOM","STAND",1,10)=CODE.CASCADE^^74^Code cascade^
 ;;^MOZ("GRILLE","TRAZOM","STAND",2)=MOZLIGN2
 ;;^MOZ("GRILLE","TRAZOM","STAND",2,1)=ACTION^^10^Action^ACTION
 ;;^MOZ("GRILLE","TRAZOM","STAND",2,2)=OBJET^^30^Objet^OBJET
 ;;^MOZ("GRILLE","TRAZOM","STAND",2,3)=MANIERE^^50^Maniere^MANIERE
 ;;^MOZ("GRILLE","TRAZOM","STAND",2,4)=OUTIL^^70^Outil^OUTIL
 ;

