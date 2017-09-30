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

;%TLBAACP^INT^1^59547,74028^0
%TLBAACP ;;06:27 PM  8 Apr 1992;
 
 
CHELEM 
 
 S B=BA,O=OBJ
 
 
 
 S (INIV,ITAB)=1
 S @PILE@(INIV)=ITAB
 S @TABLE@(ITAB)=O,@TABLE@(ITAB,"EN.COURS")=0
 S @TABLE@(ITAB,"CLEF")=1
 S @TEMPOLI@(1)=O_"^"_1_"^RACINE"
 S TEMPOLI=$E(TEMPOLI,1,$L(TEMPOLI)-1)
 
BFILS S TB=@PILE@(INIV)
 D MVG^%QSCALVA(B,O,RPER,$E(TABLE,1,$L(TABLE)-1)_","_TB_",""LFILS"")",.TTYP)
 S @TABLE@(TB,"EN.COURS")=0
NXFILS S TB=@PILE@(INIV),O=@TABLE@(TB)
 S (IFILS,@TABLE@(TB,"EN.COURS"))=@TABLE@(TB,"EN.COURS")+1
 S IN="" F III=1:1:IFILS S IN=$O(@TABLE@(TB,"LFILS",IN))
 G:IN'="" SUITE
 G:INIV=1 TRTNOM
 K @FILE@(O)
 S INIV=INIV-1 G NXFILS
SUITE S O=@TABLE@(TB,"LFILS",IN)
 I $D(@VU@(O))&(DEJ="SANS.REPETITION") G NXFILS
 
 I $D(@FILE@(O)) G NXFILS
 S ITAB=ITAB+1
 S III=@TABLE@(TB,"CLEF")_","_IFILS
 S @TABLE@(ITAB,"CLEF")=III
 S @(TEMPOLI_","_III_")="""_O_"^"_IN_"^"_@TABLE@(TB)_"""")
 S INIV=INIV+1,@PILE@(INIV)=ITAB
 S @TABLE@(ITAB)=O,@VU@(O)="",@FILE@(O)=""
 G BFILS
 
 
 
TRTNOM 
 S TEMPOLI=TEMPOLI_","
 D:MODAF'=0 POCLEPA^%VVIDEO
 S IN="",ARRET=0,PARTIE=""
 S (CXT(VARO,"BASE"),CXT(PERE,"BASE"))=BA
 
 G:MODEX'=3 PROF
 
 S GCLE=@GLOETD@(NIVEAU+1,"CLE.GROUPEE"),CLE=@GLOETD@(NIVEAU+1,"CLE")
 S VNIV=@GLOETD@(NIVEAU+1,"VAL.NIVEAU")
 G:SEN="EN.MONTANT" PROFM
 G PROFD
 
PROF S GCLE="",CLE="""""",VNIV=1
 G:SEN="EN.MONTANT" PRMON
 
PROFD S CLE=$O(@(TEMPOLI_GCLE_CLE_")"))
 G:CLE'="" PROFDS
 G:GCLE="" FINIT^%TLBAACN
 S VNIV=VNIV-1
 S NVIRG=$L(GCLE,",")
 S CLE=$P(GCLE,",",NVIRG-1),GCLE=$P(GCLE,",",1,NVIRG-2)_","
 S:GCLE="," GCLE=""
 G PROFD
PROFDS 
 S CXT("%",NIV)=VNIV
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,VNIV,1)
 S:GCLE="," GCLE=""
 S O=@(TEMPOLI_GCLE_CLE_")"),PA=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 S CXT(VARO,"OBJET")=O
 S CXT(PERE,"OBJET")=PA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PA,1)
 I MAP D EMPIL^%ANGEPIL("PROFDRET^%TLBAACP") G ^%TLBADEB
 S RETOURGO="PROFDRET^%TLBAACP" G GO^%TLIACT1
 
PROFDRET I MAP,ECHGL>0 S ECHEC=1
 G:((ARRET=1)!ABANDON)!HALT FINIT^%TLBAACN
 S VNIV=VNIV+1
 S GCLE=GCLE_CLE_",",CLE=""""""
 
 
 G PROFD
 
PRMON 
PROFM S CLE=$O(@(TEMPOLI_GCLE_CLE_")"))
 G:CLE'="" PROFMS
 G:GCLE="" FINIT^%TLBAACN
 S NVIRG=$L(GCLE,",")
 S CLE=$P(GCLE,",",NVIRG-1),GCLE=$P(GCLE,",",1,NVIRG-2)_","
 
 S CXT("%",NIV)=VNIV
 S VNIV=VNIV-1
 S:GCLE="," GCLE=""
 S O=@(TEMPOLI_GCLE_CLE_")"),PA=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,VNIV,1)
 S CXT(PERE,"OBJET")=PA,CXT(VARO,"OBJET")=O
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PA,1)
 I MAP D EMPIL^%ANGEPIL("PROFMRET^%TLBAACP") G ^%TLBADEB
 S RETOURGO="PROFMRET^%TLBAACP" G GO^%TLIACT1
PROFMRET I MAP S:ECHGL>1 ECHEC=1
 
 
 G:((ARRET=1)!ABANDON)!HALT FINIT^%TLBAACN
 G PROFM
 
PROFMS S GCLE=GCLE_CLE_",",CLE=""""""
 S VNIV=VNIV+1
 G PROFM
 ;

