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

;%TLBAACO^INT^1^59547,74028^0
%TLBAACO ;;06:26 PM  8 Apr 1992;
 
 
 
CHELEM 
 
 S B=BA,O=OBJ
 
 S @FILE@("1x1")=""
 S @TEMPOLI@(1,1)=O_"^"_1_"^RACINE"
 S ITAB=1,INIV=""
BFILS S INIV=$O(@TEMPOLI@(INIV)) G:INIV="" TRTNOM
 S VNIV=""
BFRERE S VNIV=$O(@TEMPOLI@(INIV,VNIV)) G:VNIV="" BFILS
 S O=$P(@TEMPOLI@(INIV,VNIV),"^")
 K @(LLIST)
 D MVG^%QSCALVA(B,O,RPER,LLIST,.TTYP)
 S IN="" F III=0:0 S IN=$O(@LLIST@(IN)) Q:IN=""  D FILS
 G BFRERE
FILS S FILS=@LLIST@(IN)
 I DEJ="SANS.REPETITION" Q:$D(@VU@(FILS))
 I $D(@VU@(FILS)),$$CYCLE Q
 S @VU@(FILS)="",ITAB=ITAB+1,@TEMPOLI@(INIV+1,ITAB)=FILS_"^"_IN_"^"_O
 S @FILE@((INIV+1)_"x"_ITAB)=INIV_"x"_VNIV
 Q
 
CYCLE() S CLEF=INIV_"x"_VNIV
CYC2 Q:CLEF="" 0
 I $P(@TEMPOLI@($P(CLEF,"x"),$P(CLEF,"x",2)),"^")=FILS Q 1
 S CLEF=@FILE@(CLEF) G CYC2
 
 
 
 
 
TRTNOM 
 D:MODAF'=0 POCLEPA^%VVIDEO
 S IN="",ARRET=0,PARTIE=""
 S (CXT(VARO,"BASE"),CXT(PERE,"BASE"))=BA
 
 G:MODEX'=3 LARG
 
 S INIV=@GLOETD@(NIVEAU+1,"IND.NIVEAU")
 S VNIV=@GLOETD@(NIVEAU+1,"VAL.NIVEAU"),NB=@GLOETD@(NIVEAU+1,"IND.SUR.NIVEAU")
 S CXT("%",NIV)=VNIV
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,INIV,1)
 G BLARNN
 
LARG S INIV="",VNIV=0
BLARN S INIV=$S(SEN="EN.DESCENDANT":$O(@TEMPOLI@(INIV)),1:$ZP(@TEMPOLI@(INIV)))
 G:INIV="" FINIT^%TLBAACN
 S NB="",VNIV=VNIV+1
 S CXT("%",NIV)=VNIV
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,INIV,1)
BLARNN S NB=$O(@TEMPOLI@(INIV,NB))
 G:NB="" BLARN
 S O=@TEMPOLI@(INIV,NB)
 S PA=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 S CXT(VARO,"OBJET")=O,CXT(PERE,"OBJET")=PA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PA,1)
 K @TEMPOLI@(INIV,NB)
 I MAP D EMPIL^%ANGEPIL("RETLAR^%TLBAACO") G ^%TLBADEB
 S RETOURGO="RETLAR^%TLBAACO" G GO^%TLIACT1
RETLAR I MAP,ECHGL>0 S ECHEC=1
 
 
 G:((ARRET=1)!ABANDON)!HALT FINIT^%TLBAACN
 G BLARNN
 ;

