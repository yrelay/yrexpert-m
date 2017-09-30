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

;%SYSLK^INT^1^59547,73892^0
%XXX ;
 
 K ^XXX
 S ET=$$BLD^%VVIDEO1_"*"_$$NORM^%VVIDEO1
 D ZD^%QMDATE4,EBCD S IO=47
 S %ERRVU=0,DAAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),NL=0
 S $ZT="ERR"
 O 47:("EVL":0:16384)
 
 U 0 W !,"RWD" U 47 W *-5 U 0 W !,"FINI"
 
 N %ST D ^%ST
 S GVECA=%ST("GVEC"),VWBUFA=%ST("VBUF"),LINKA=2040
 W OLDWTC*
 C 63 O 63
MTBUFF S MTBUFA=((IO-47)*2)+%ST("BUFFS")
 S BUFDESC(1)=$V(MTBUFA,-4,2),BUFDESC(2)=$V(VWBUFA,-1,2)
 S BUFNUM=1 V VWBUFA:-1:2:BUFDESC(1)
 S Z2=0
LOOP F Z22=1:1 D LOOP1
FIN V MTBUFA:-4:2:BUFDESC(1),VWBUFA:-1:2:BUFDESC(2) K BUFDESC
 C 47 C 63 K %OCH,Z,Z1,Z2,NL,DAAT,REP Q
 
LOOP1 S Z2=Z2+1 U 47 W *-6 S ZB=$ZB,OFFSET=$S(ZB>256:ZB-((ZB\256)*256),1:0)
 U 0 S DX=0,DY=12 W !,!,"Bloc No : ",Z2," $ZB = ",ZB," offset ",OFFSET
 
 F Z=0:1:63 D GET
 Q
ERR S ZA=$ZA,ZB=$ZB U 0 S DX=0,DY=23 W !,$ZE," $ZA = ",ZA," $ZB = ",$ZB H 1 S %ERRVU=%ERRVU+1 G:%ERRVU'>1 ERR2
ERR1 S $ZT="" W !,$$L2^%QSLIB R *REP:0 D TOUCHE^%INCCLAV(REP,.REP) G:REP=1 FIN
 U 0
ERR2 S $ZT="ERR" U 47 W *-2 G LOOP
 
GET S %OCH="",CH="" F Z1=0:1:255 S AA=$V((256*Z)+Z1,0,1),%OCH=%OCH_EBCDIC(AA),CH=CH_$C(AA)
 S NL=NL+1,^XXX($J,1,NL)=%OCH,^XXX($J,2,NL)=CH
 U 0 W !,!,ET,%OCH
 Q
EBC ;;................................................................
 ;; .........[.<(+|&.........!$*);^-/........],%_>?.........`:#@'="
 ;;.abcdefghi.......jklmnopqr.......~stuvwxyz......................
 ;;{ABCDEFGHI......}JKLMNOPQR......\.STUVWXYZ......0123456789......
EBCD F I=0:1:3 S X=$P($T(EBC+I),";;",2) F J=0:1:63 S EBCDIC((I*64)+J)=$E(X,J+1)
 Q

