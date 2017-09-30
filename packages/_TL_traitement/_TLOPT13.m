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

;%TLOPT13^INT^1^59547,74030^0
%TLOPT13 ;;05:41 PM  2 Jun 1992; ; 02 Jul 92 11:42 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AJOBJ(IDEB,NBREG) 
 N OBJ,VERS,NUM,OBJ,VO,X0,Y0,ANG,ECH,POS,MSG
 
 S COL=V(IDEB),VERS=V(IDEB+1)
 
 I V(IDEB+2)=$C(0) S NUM="" G AJ2
 S NUM=V(IDEB+2)
 
 
AJ2 
 S OBJ=V(IDEB+3),VO=V(IDEB+4)
 
 
 I (((V(IDEB+5)=$C(0))&(V(IDEB+6)=$C(0)))&(V(IDEB+7)=$C(0)))&(V(IDEB+8)=$C(0)) S X0=0,Y0=0,ANG=0,ECH=1 G AJ3
 S X0=$S(V(IDEB+5)=$C(0):0,1:V(IDEB+5))
 S Y0=$S(V(IDEB+6)=$C(0):0,1:V(IDEB+6))
 S ANG=$S(V(IDEB+7)=$C(0):0,1:V(IDEB+7))
 S ECH=$S(V(IDEB+8)=$C(0):1,1:V(IDEB+8))
AJ3 
 D AJOBJ^%SDCCMS(COL,VERS,.NUM,OBJ,VO,X0,Y0,ANG,ECH)
 Q 1
 
 
 
 
 
 
 
 
 
 
RETOBJ(IDEB,NBREG) 
 N OBJ,VERS,NUM,COL
 
 S COL=V(IDEB),VERS=V(IDEB+1)
 
 
 S NUM=V(IDEB+2)
 
 
 D RETOBJ^%SDCCMS(COL,VERS,NUM)
 Q 1
 ;

