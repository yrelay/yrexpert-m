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

;%ZGEPC^INT^1^59550,33684^0
%ZGEPC ;
 
 
INIT20 S NUMIX=20 G INIT
INIT21 S NUMIX=21
INIT S STR=""
 F I=1:1 S L=$P($T(@NUMIX+I),";;",2) Q:L=""  S FROM=$P(L,"/"),TO=$P(L,"/",2) F G="FROM","TO" S T=$L(@G,","),STR=STR_$C(T) F J=1:1:T S STR=STR_$C($P(@G,",",J))
 ;HL S VALRES=$$load^%mdevxlate(NUMIX,STR,2048)
 Q
 
 
 
1 ;;
 ;;0,16/241/
 ;;0,18/229/altE
 ;;0,19/242/
 ;;0,31/243/altS
 ;;0,32/228/altD
 ;;0,33/230/altF
 ;;0,36/234/altJ
 ;;0,45/248/altX
 ;;0,46/227/altC
 ;;0,48/226/altB
 ;;0,50/237/altM
 ;;0,59/21/F1
 ;;0,60/22/F2
 ;;0,61/23/F3
 ;;0,62/24/F4
 ;;0,63/25/F5
 ;;0,64/26/F6
 ;;0,65/28/F7
 ;;0,66/29/F8
 ;;0,67/30/F9
 ;;0,68/31/
 ;;0,72/1/fleche haut
 ;;0,73/5/page up
 ;;0,75/14/fleche gauche
 ;;0,77/18/fleche droit
 ;;0,79/4/
 ;;0,80/11/fleche bas
 ;;0,81/12/page down
 ;;0,83/127/delete
 ;;0,104/7/alt F1
 ;;0,105/15/alt F2
 ;;0,106/20/altF3
 ;;0,107/130/altF4
 ;;0,112/2/altF9
 ;;0,113/16/altF10
 ;;0,115/142/
 ;;0,116/146/
 ;;0,118/19/
 ;;0,132/17/
 ;;
 
 
20 ;;
 ;;0,16/241/
 ;;0,18/229/altE
 ;;0,19/242/
 ;;0,31/243/altS
 ;;0,32/228/altD
 ;;0,33/230/altF
 ;;0,36/234/altJ
 ;;0,45/248/altX
 ;;0,46/227/altC
 ;;0,48/226/altB
 ;;0,50/237/altM
 ;;0,59/210/F1 (modif yxp)
 ;;0,60/211/F2 (modif yxp)
 ;;0,61/212/F3
 ;;0,62/213/F4
 ;;0,63/214/F5
 ;;0,64/215/F6
 ;;0,65/216/F7
 ;;0,66/217/F8
 ;;0,67/218/F9
 ;;0,68/219/F10
 ;;0,71/204/home (ajout yxp)
 ;;0,72/202/fleche haut (modif yxp)
 ;;0,73/205/page up(modif yxp)
 ;;0,75/201/fleche gauche (modif yxp)
 ;;0,76/206/5 du pave numerique (ajout yxp)
 ;;0,77/200/fleche droit (modif yxp)
 ;;0,79/207/end (modif yxp)
 ;;0,80/203/fleche bas (modif yxp)
 ;;0,81/208/page down (modif yxp)
 ;;0,83/209/delete next car (ajout yxp)
 ;;0,104/7/alt F1
 ;;0,105/15/alt F2
 ;;0,106/20/altF3
 ;;0,107/130/altF4
 ;;0,112/2/altF9
 ;;0,113/16/altF10
 ;;0,115/142/
 ;;0,116/146/
 ;;0,118/19/
 ;;0,132/17/
 ;;
 
 
2 ;;
 ;;27,79,80/4/
 ;;27,79,81/21/
 ;;27,79,82/12/
 ;;27,79,83/5/
 ;;27,91,65/1/
 ;;27,91,66/11/
 ;;27,91,67/18/
 ;;27,91,68/14/  
 ;;
 
 
21 ;;
 ;;27,79,80/210/touche de fonction PF1 (modif yxp)
 ;;27,79,81/211/touche de fonction PF2 (modif yxp)
 ;;27,79,82/212/touche de fonction PF3 (modif yxp)
 ;;27,79,83/213/touche de fonction PF4 (modif yxp)
 ;;27,91,49,55,126/215/touche de fonction F6 (ajout yxp)
 ;;27,91,49,56,126/216/touche de fonction F7 (ajout yxp)
 ;;27,91,49,57,126/217/touche de fonction F8 (ajout yxp)
 ;;27,91,50,48,126/218/touche de fonction F9 (ajout yxp)
 ;;27,91,50,49,126/219/touche de fonction F10 (ajout yxp)
 ;;27,91,50,51,126/220/touche de fonction F11 (ajout yxp)
 ;;27,91,50,52,126/221/touche de fonction F12 (ajout yxp)
 ;;27,91,65/202/fleche haut (modif yxp)
 ;;27,91,66/203/fleche bas (modif yxp)
 ;;27,91,67/200/fleche droit (modif yxp)
 ;;27,91,68/201/fleche gauche (modif yxp)
 ;;27,91,54,126/208/page down (ajout yxp)
 ;;27,91,53,126/205/page up (ajout yxp)
 ;;27,91,51,126/209/delete next char (ajout yxp)
 ;;27,79,108/228/- du pave numerique (ajout yxp)
 ;;27,79,109/229/, du pave numerique (ajout yxp)
 ;;27,79,110/230/. du pave numerique (ajout yxp)
 ;;27,79,112/232/0 du pave numerique (ajout yxp)
 ;;27,79,113/233/1 du pave numerique (ajout yxp)
 ;;27,79,114/234/2 du pave numerique (ajout yxp)
 ;;27,79,115/235/3 du pave numerique (ajout yxp)
 ;;27,79,116/236/4 du pave numerique (ajout yxp)
 ;;27,79,117/237/5 du pave numerique (ajout yxp)
 ;;27,79,118/238/6 du pave numerique (ajout yxp)
 ;;27,79,119/239/7 du pave numerique (ajout yxp)
 ;;27,79,120/240/8 du pave numerique (ajout yxp)
 ;;27,79,121/241/9 du pave numerique (ajout yxp)
 ;;
 ;

